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

/****************************END OF FILE****/
