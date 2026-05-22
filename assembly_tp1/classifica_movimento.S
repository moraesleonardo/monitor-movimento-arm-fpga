.global _start

.section .data
valores:
    .quad 10, 50, 51, 80, 120, 121, 180, 255

tamanho:
    .quad 8

contador_normal:
    .quad 0

contador_atencao:
    .quad 0

contador_alerta:
    .quad 0

.section .text
_start:
    // x0 = endereço inicial da lista de valores
    ldr x0, =valores

    // x1 = quantidade de elementos da lista
    ldr x1, =tamanho
    ldr x1, [x1]

    // x2 = índice atual
    mov x2, #0

loop:
    // Verifica se o índice chegou ao tamanho da lista
    cmp x2, x1
    b.ge fim

    // Carrega valores[x2]
    ldr x3, [x0, x2, lsl #3]

    // Se valor <= 50, classifica como Normal
    cmp x3, #50
    b.le normal

    // Se valor <= 120, classifica como Atenção
    cmp x3, #120
    b.le atencao

    // Caso contrário, classifica como Alerta
    b alerta

normal:
    ldr x4, =contador_normal
    ldr x5, [x4]
    add x5, x5, #1
    str x5, [x4]
    b proximo

atencao:
    ldr x4, =contador_atencao
    ldr x5, [x4]
    add x5, x5, #1
    str x5, [x4]
    b proximo

alerta:
    ldr x4, =contador_alerta
    ldr x5, [x4]
    add x5, x5, #1
    str x5, [x4]
    b proximo

proximo:
    // Avança para o próximo índice
    add x2, x2, #1
    b loop

fim:
    // Encerramento controlado do programa
    mov x0, #0      // código de retorno 0
    mov x8, #93     // syscall exit no Linux AArch64
    svc #0
