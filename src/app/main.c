/**
  * @file main.c
  * @author XXX
  * @brief application main source file
  * 
  * All Contents@CopyRight Of EVE Energy Co., Ltd.
  * 
  * Date            Author          Description
  * ----------      ----------      -----------------------------------------
  * 2025-05-03      zdk             Initial created
  */

/* Includes ------------------------------------------------------------------*/

#include "main.h"
#include <stdio.h>
#include "submodule_a.h"
#include "submodule_b.h"
#include "third_party_a.h"
#include "third_party_b.h"

/** @addtogroup app
  * @{
  */
/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private functions prototype -----------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private functions definition ----------------------------------------------*/

/* Exported functions definition ---------------------------------------------*/

int main(void)
{
    printf("Hello world!\n");
    submodule_a_output();
    submodule_b_output();
    third_party_a_output();
    third_party_b_output();
    return 0;
}

/**
  * @}
  */ 

/*********************** (C) COPYRIGHT XXX XXXX Co., Ltd. *****END OF FILE****/
