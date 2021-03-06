/*
 * tcpclient.c
 *
 *  Created on: Oct 4, 2020
 *      Author: bop
 */

#include "lwip/opt.h"
#if LWIP_SOCKET
#include "lwip/netifapi.h"
#include "lwip/tcpip.h"
#include "netif/ethernet.h"
#include "enet_ethernetif.h"

#include "board.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_gpio.h"
#include "fsl_iomuxc.h"
#include "user.h"
#define configIP_ADDR0 192
#define configIP_ADDR1 168
#define configIP_ADDR2 0
#define configIP_ADDR3 102

/* Netmask configuration. */
#define configNET_MASK0 255
#define configNET_MASK1 255
#define configNET_MASK2 255
#define configNET_MASK3 0

/* Gateway address configuration. */
#define configGW_ADDR0 192
#define configGW_ADDR1 168
#define configGW_ADDR2 0
#define configGW_ADDR3 100



/* MAC address configuration. */
#define configMAC_ADDR                     \
    {                                      \
        0x02, 0x12, 0x13, 0x10, 0x15, 0x11 \
    }

#define EXAMPLE_PHY_ADDRESS BOARD_ENET0_PHY_ADDRESS

/* System clock name. */
#define EXAMPLE_CLOCK_NAME kCLOCK_CoreSysClk

#ifndef EXAMPLE_NETIF_INIT_FN
/*! @brief Network interface initialization function. */
#define EXAMPLE_NETIF_INIT_FN ethernetif0_init
#endif
#endif
void BOARD_InitModuleClock(void)
{
    const clock_enet_pll_config_t config = {
        .enableClkOutput = true, .enableClkOutput500M = false, .enableClkOutput25M = false, .loopDivider = 1};
    CLOCK_InitEnetPll(&config);
}

void delay(void)
{
    volatile uint32_t i = 0;
    for (i = 0; i < 1000000; ++i)
    {
        __asm("NOP"); /* delay */
    }
}

int main()
{
	static struct netif netif;
	ip4_addr_t netif_ipaddr, netif_netmask, netif_gw;
	ethernetif_config_t enet_config = {
	        .phyAddress = EXAMPLE_PHY_ADDRESS,
	        .clockName  = EXAMPLE_CLOCK_NAME,
	        .macAddress = configMAC_ADDR,};
	gpio_pin_config_t gpio_config = {kGPIO_DigitalOutput, 0, kGPIO_NoIntmode};
	BOARD_ConfigMPU();
	BOARD_InitPins();
	BOARD_BootClockRUN();
	    //BOARD_InitDebugConsole();
	BOARD_InitModuleClock();
	IOMUXC_EnableMode(IOMUXC_GPR, kIOMUXC_GPR_ENET1TxClkOutputDir, true);
	GPIO_PinInit(GPIO1, 4, &gpio_config);
	GPIO_PinInit(GPIO1, 22, &gpio_config);
	/* pull up the ENET_INT before RESET. */
	GPIO_WritePinOutput(GPIO1, 22, 1);
	GPIO_WritePinOutput(GPIO1, 4, 0);
	delay();
	GPIO_WritePinOutput(GPIO1, 4, 1);
	IP4_ADDR(&netif_ipaddr, configIP_ADDR0, configIP_ADDR1, configIP_ADDR2, configIP_ADDR3);
	IP4_ADDR(&netif_netmask, configNET_MASK0, configNET_MASK1, configNET_MASK2, configNET_MASK3);
	IP4_ADDR(&netif_gw, configGW_ADDR0, configGW_ADDR1, configGW_ADDR2, configGW_ADDR3);
	tcpip_init(NULL, NULL);

	netifapi_netif_add(&netif, &netif_ipaddr, &netif_netmask, &netif_gw, &enet_config, EXAMPLE_NETIF_INIT_FN,
	                       tcpip_input);
	netifapi_netif_set_default(&netif);
	netifapi_netif_set_up(&netif);
	tcpClientInit();
	vTaskStartScheduler();

	while(1)
	{

	}
	return 0;
}
