################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip/port/enet_ethernetif.c \
../lwip/port/enet_ethernetif_kinetis.c \
../lwip/port/sys_arch.c 

OBJS += \
./lwip/port/enet_ethernetif.o \
./lwip/port/enet_ethernetif_kinetis.o \
./lwip/port/sys_arch.o 

C_DEPS += \
./lwip/port/enet_ethernetif.d \
./lwip/port/enet_ethernetif_kinetis.d \
./lwip/port/sys_arch.d 


# Each subdirectory must supply rules for building sources it contributes
lwip/port/%.o: ../lwip/port/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DENETHARDCHECKSUM -D__REDLIB__ -DCPU_MIMXRT1021DAG5A -DCPU_MIMXRT1021DAG5A_cm7 -DFSL_SDK_ENABLE_DRIVER_CACHE_CONTROL=1 -DXIP_BOOT_HEADER_DCD_ENABLE=1 -DSKIP_SYSCLK_INIT -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DFSL_FEATURE_PHYKSZ8081_USE_RMII50M_MODE -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -DFSL_RTOS_FREE_RTOS -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_OS_FREE_RTOS -DSDK_DEBUGCONSOLE=0 -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\drivers" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\component\serial_manager" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\CMSIS" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\xip" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\board" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\source" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\port" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\amazon-freertos\freertos_kernel\include" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\amazon-freertos\freertos_kernel\portable\GCC\ARM_CM4F" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\component\uart" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\device" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\component\lists" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\contrib\apps\tcpecho" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\utilities" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\port\arch" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\posix\arpa" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\posix\net" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\posix" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\posix\sys" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\stdc" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\lwip" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\lwip\priv" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\lwip\prot" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\netif" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\netif\ppp" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\netif\ppp\polarssl" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\drivers" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\component\serial_manager" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\CMSIS" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\xip" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\board" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\source" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\port" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\amazon-freertos\freertos_kernel\include" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\amazon-freertos\freertos_kernel\portable\GCC\ARM_CM4F" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\component\uart" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\device" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\component\lists" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\contrib\apps\tcpecho" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\utilities" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\port\arch" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\posix\arpa" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\posix\net" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\posix" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\posix\sys" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\compat\stdc" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\lwip" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\lwip\priv" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\lwip\prot" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\netif" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\netif\ppp" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include\netif\ppp\polarssl" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos\lwip\src\include" -I"C:\Users\bop\Documents\MCUXpressoIDE_11.1.1_3241\workspace\evkmimxrt1020_lwip_tcpecho_freertos" -O0 -fno-common -g3 -Wall -c  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


