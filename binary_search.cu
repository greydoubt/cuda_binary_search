__device__ // flag for cuda
int get_index(const char* original, const char* target, unsigned len) {
    int left = 0;
    int right = len - 1;

    while (left <= right) {
      
        int m = left + (right - left) / 2;
        const char* query = original + m * MAX_ENTITY_BYTE;
        int c = cuda_strcmp(query, target); 
      
        if (c == 0)
            return m;
        else if (c < 0)
            left = m + 1;
        else
            right = m - 1;
    }
    return -1;
}
