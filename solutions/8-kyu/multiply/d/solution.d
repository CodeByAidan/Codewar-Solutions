module solution;

export int multiply(int a, int b) {
    return b == 1 ? a : a + multiply(a, b- 1);
}









































// grass yummy