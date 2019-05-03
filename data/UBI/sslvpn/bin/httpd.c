//
// This file was generated by the Retargetable Decompiler
// Website: https://retdec.com
// Copyright (c) 2019 Retargetable Decompiler <info@retdec.com>
//

#include <stdint.h>

// ------------------------ Structures ------------------------

struct in_addr {
    int32_t e0;
};

// ------------------- Function Prototypes --------------------

int32_t _close(int32_t a1);
int32_t _fprintf(int32_t a1, char * a2);
int32_t _inet_aton(char * a1, struct in_addr * a2);
int32_t _kill(int32_t a1, int32_t a2);
int32_t _sessionUnRegisterApi(int32_t a1, int32_t a2);
int32_t _shutdown(int32_t a1, int32_t a2);
int32_t _sprintf(char * a1, char * a2);
int32_t _system(char * a1);
int32_t httpdAccessLog(int32_t a1);
int32_t httpdCloseTunnel(int32_t * a1, int32_t a2);
int32_t httpdErrorLog(int32_t a1);
int32_t httpdLogMessage(int32_t a1);

// ------------------------ Functions -------------------------

// Address range: 0x10010978 - 0x10010b38
int32_t httpdCloseTunnel(int32_t * a1, int32_t a2) {
    int32_t v1 = 0; // 0x10010988
    int32_t v2 = v1 + 0x216a8; // 0x1001098c
    int32_t v3 = (int32_t)a1; // 0x10010990
    int32_t * v4 = (int32_t *)(v1 + 0x196c0); // 0x10010994
    int32_t v5 = *(int32_t *)(*(int32_t *)*v4 + 12); // 0x100109a4
    int32_t v6; // bp-176
    int32_t v7; // bp-48
    int32_t v8; // 0x10010a60
    int32_t v9; // 0x10010a78
    int32_t v10; // 0x10010ad4
    int32_t v11; // 0x10010af4
    int32_t result; // v0
    int32_t v12; // 0x10010a38
    int32_t v13; // 0x10010b14
    int32_t v14; // 0x10010a80
    int32_t v15; // 0x10010af4
    if (v5 != 0) {
        int32_t v16 = *(int32_t *)(v1 + 0x196c4); // 0x100109b0
        int32_t v17; // 0x10010a1c
        if (*(int32_t *)(*(int32_t *)v16 + 376) >= 4) {
            // 0x100109c8
            _fprintf(v5, (char *)(*(int32_t *)(v1 + 0x196c8) + 0x65d8));
            httpdLogMessage(*(int32_t *)(v2 - 0x7fe0) + 0x7c20);
            // branch -> 0x10010a0c
            // 0x10010a0c
            v17 = *(int32_t *)(v2 - 0x7fe8);
            // branch -> 0x10010a10
        } else {
            v17 = *v4;
        }
        // 0x10010a10
        v7 = 0;
        *(int32_t *)(*(int32_t *)v17 + 76) = 0;
        _inet_aton((char *)(v3 + 2512), (struct in_addr *)&v7);
        v12 = *(int32_t *)(v2 - 0x7fe0) + 0x7c78;
        _sprintf((char *)&v6, (char *)v12);
        _system((char *)&v6);
        if (a2 != 0) {
            // 0x10010a5c
            v8 = v3;
            _sessionUnRegisterApi(v8 + 2256, *(int32_t *)(v8 + 2244));
            // branch -> 0x10010a70
        }
        // 0x10010a70
        httpdErrorLog(v3);
        v9 = v2;
        v14 = *(int32_t *)(*(int32_t *)*(int32_t *)(v9 - 0x7fe8) + 12);
        if (v14 == 0) {
            // 0x10010acc
            // branch -> 0x10010ad0
        } else {
            // 0x10010a8c
            if (*(int32_t *)(*(int32_t *)*(int32_t *)(v9 - 0x7fe4) + 376) >= 3) {
                // 0x10010aa0
                _fprintf(v14, (char *)(*(int32_t *)(v9 - 0x7fe0) + 0x59a8));
                httpdLogMessage(*(int32_t *)(v2 - 0x7fe0) + 0x7c98);
                // branch -> 0x10010acc
                // 0x10010acc
                // branch -> 0x10010ad0
            }
        }
        // 0x10010ad0
        v10 = v3;
        httpdAccessLog(v10);
        _shutdown(v10, 2);
        _close(*(int32_t *)(v3 + 2244));
        v11 = v3;
        v15 = *(int32_t *)(v11 + 2784);
        if (v15 != 0) {
            // 0x10010b00
            _kill(v15, 2);
            v13 = v3;
            // branch -> 0x10010b10
        } else {
            v13 = v11;
        }
        // 0x10010b10
        *(int32_t *)(v13 + 8) = 14;
        result = 1;
        *(int32_t *)(v3 + 2244) = 0;
        *(int32_t *)(v3 + 24) = result;
        return result;
    }
    // 0x10010a0c
    // branch -> 0x10010a10
    // 0x10010a10
    *(int32_t *)(*(int32_t *)*(int32_t *)(v2 - 0x7fe8) + 76) = 0;
    _inet_aton((char *)(v3 + 2512), (struct in_addr *)&v7);
    v12 = *(int32_t *)(v2 - 0x7fe0) + 0x7c78;
    _sprintf((char *)&v6, (char *)v12);
    _system((char *)&v6);
    if (a2 != 0) {
        // 0x10010a5c
        v8 = v3;
        _sessionUnRegisterApi(v8 + 2256, *(int32_t *)(v8 + 2244));
        // branch -> 0x10010a70
    }
    // 0x10010a70
    httpdErrorLog(v3);
    v9 = v2;
    v14 = *(int32_t *)(*(int32_t *)*(int32_t *)(v9 - 0x7fe8) + 12);
    if (v14 == 0) {
        // 0x10010acc
        // branch -> 0x10010ad0
        // 0x10010ad0
        v10 = v3;
        httpdAccessLog(v10);
        _shutdown(v10, 2);
        _close(*(int32_t *)(v3 + 2244));
        v11 = v3;
        v15 = *(int32_t *)(v11 + 2784);
        if (v15 != 0) {
            // 0x10010b00
            _kill(v15, 2);
            v13 = v3;
            // branch -> 0x10010b10
        } else {
            v13 = v11;
        }
        // 0x10010b10
        *(int32_t *)(v13 + 8) = 14;
        result = 1;
        *(int32_t *)(v3 + 2244) = 0;
        *(int32_t *)(v3 + 24) = result;
        return result;
    }
    // 0x10010a8c
    if (*(int32_t *)(*(int32_t *)*(int32_t *)(v9 - 0x7fe4) + 376) >= 3) {
        // 0x10010aa0
        _fprintf(v14, (char *)(*(int32_t *)(v9 - 0x7fe0) + 0x59a8));
        httpdLogMessage(*(int32_t *)(v2 - 0x7fe0) + 0x7c98);
        // branch -> 0x10010acc
        // 0x10010acc
        // branch -> 0x10010ad0
    }
    // 0x10010ad0
    v10 = v3;
    httpdAccessLog(v10);
    _shutdown(v10, 2);
    _close(*(int32_t *)(v3 + 2244));
    v11 = v3;
    v15 = *(int32_t *)(v11 + 2784);
    if (v15 != 0) {
        // 0x10010b00
        _kill(v15, 2);
        v13 = v3;
        // branch -> 0x10010b10
    } else {
        v13 = v11;
    }
    // 0x10010b10
    *(int32_t *)(v13 + 8) = 14;
    result = 1;
    *(int32_t *)(v3 + 2244) = 0;
    *(int32_t *)(v3 + 24) = result;
    return result;
}

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gc
// Detected functions: 1
// Decompilation date: 2019-05-01 22:18:08