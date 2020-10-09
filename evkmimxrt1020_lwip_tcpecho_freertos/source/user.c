/*
 * user.c
 *
 *  Created on: Oct 4, 2020
 *      Author: bop
 */

#include "user.h"
#include "lwip/netifapi.h"
#include "lwip/tcpip.h"
#include "netif/ethernet.h"
#include "enet_ethernetif.h"

#include "board.h"
#include "lwip/opt.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/api.h"
#include "FreeRTOSConfig.h"
//#include "arch/sys_arch.h"
#include "string.h"
#include "stdio.h"
//StaticQueue_t    EnetTxQueueBuffer;
//StaticQueue_t    EnetRxQueueBuffer;
//AT_NONCACHEABLE_SECTION_ALIGN(uint8_t ucEnetTxQueueStorage[QUEUE_LENGTH*ITEM_SIZE],4);
//AT_NONCACHEABLE_SECTION_ALIGN(uint8_t ucEnetRxQueueStorage[QUEUE_LENGTH*ITEM_SIZE],4);
QueueHandle_t EnetTxQueue= NULL;
QueueHandle_t EnetRxQueue=NULL;
char recbuff[MAXLINE+1];
void tcpClientThread(void* arg);
void EnetSendMsgThread(void* arg);
void EnetRecMsgThread(void* arg);


void tcpClientInit(void)
{
	sys_thread_new("tcpclient_thread",tcpClientThread,NULL,DEFAULT_THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);
	EnetTxQueue = xQueueCreate(QUEUE_LENGTH,ITEM_SIZE);
	//EnetRxQueue = xQueueCreate(QUEUE_LENGTH,ITEM_SIZE);
	xTaskCreate(EnetSendMsgThread,"Enternet Send Msg",configMINIMAL_STACK_SIZE+300 ,NULL,4,NULL);
	//xTaskCreate(EnetRecMsgThread,"Ethernet Rec Msg",configMINIMAL_STACK_SIZE+300 ,NULL,3,NULL);
}

void tcpClientThread(void* arg)
{
	int sock = -1;
	int result = 0;
	int nn;
	struct sockaddr_in clientaddr;
	ip4_addr_t destAddr;
	fd_set fd_read;
	fd_set fd_write;
	char  msg[MAXLINE];
	IP4_ADDR(&destAddr,DESTIP_ADDR0,DESTIP_ADDR1,DESTIP_ADDR2,DESTIP_ADDR3);
	sock = socket(AF_INET,SOCK_STREAM,0);
	LWIP_ERROR("Create socker error!\n",(sock>=0),return);
	clientaddr.sin_family = AF_INET;
	clientaddr.sin_port = htons(8000);
	clientaddr.sin_addr.s_addr = destAddr.addr;
	memset(&(clientaddr.sin_zero),0,sizeof(clientaddr.sin_zero));

	result = connect(sock,(struct sockaddr*)&clientaddr,sizeof(struct sockaddr));
	if(result==-1)
	{
		closesocket(sock);

	}
	LWIP_ERROR("Connection error!\n",(result!=-1),return);
	fcntl(sock,F_SETFL,O_NONBLOCK);
	FD_ZERO(&fd_read);
	FD_ZERO(&fd_write);
	while(1)
	{
		//nn= read(sock,recbuff,MAXLINE);
		//recbuff[nn]=0;
		//printf("%s\n",recbuff);
		FD_SET(sock,&fd_read);
		FD_SET(sock,&fd_write);
		select(sock+1,&fd_read,&fd_write,NULL,NULL);
		if(FD_ISSET(sock,&fd_read))
		{
			nn=read(sock,recbuff,MAXLINE);
			recbuff[nn]=0;
			printf("%s\n",recbuff);
		}
		if(FD_ISSET(sock,&fd_write))
		{
			xQueueReceive(EnetTxQueue,msg,1000);
			write(sock,msg,MAXLINE);
		}

		vTaskDelay(100);
	}


}

void EnetSendMsgThread(void* arg)
{
	char Msg[MAXLINE]="Hello Server";
	while(1)
	{
		xQueueSendToBack(EnetTxQueue,Msg,10);
		vTaskDelay(500);
	}


}
