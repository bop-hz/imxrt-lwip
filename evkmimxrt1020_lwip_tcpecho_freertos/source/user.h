/*
 * user.h
 *
 *  Created on: Oct 4, 2020
 *      Author: bop
 */

#ifndef USER_H_
#define USER_H_
// Tx Queue for ethernet
#include "fsl_common.h"
#include "FreeRTOS.h"
#include "queue.h"
#define  MAXLINE 		   20
#define ITEM_SIZE    sizeof(char)*MAXLINE
#define QUEUE_LENGTH       20

/* Destination IP */
#define DESTIP_ADDR0 		192
#define DESTIP_ADDR1		168
#define DESTIP_ADDR2		0
#define DESTIP_ADDR3		101
void tcpClientInit(void);
//#include "task.h"

#endif /* USER_H_ */
