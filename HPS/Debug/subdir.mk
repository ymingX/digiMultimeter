################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c 

OBJS += \
./main.o 

C_DEPS += \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
main.o: ../main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler 4 [arm-linux-gnueabihf]'
	arm-linux-gnueabihf-gcc -IC:/intelFPGA/18.1/ip/altera -IC:/intelFPGA/18.1/ip/altera/sopc_builder_ip -IC:/intelFPGA/18.1/embedded/ip/altera/hps/altera_hps/hwlib/include -IC:/intelFPGA/18.1/embedded/ip/altera/hps/altera_hps/hwlib/include/soc_cv_av -O0 -g -Wall -c -fmessage-length=0 -std=c11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"main.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


