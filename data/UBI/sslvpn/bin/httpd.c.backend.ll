source_filename = "test"
target datalayout = "e-p:32:32:32-f80:32:32"

%in_addr = type { i32 }

declare i32 @httpdAccessLog(i32) local_unnamed_addr

declare i32 @httpdErrorLog(i32) local_unnamed_addr

declare i32 @httpdLogMessage(i32) local_unnamed_addr

define i32 @httpdCloseTunnel(i32* %arg1, i32 %arg2) local_unnamed_addr {
dec_label_pc_10010978:
  %a0.global-to-local = alloca i32, align 4
  %a1.global-to-local = alloca i32, align 4
  %gp.global-to-local = alloca i32, align 4
  %ra.global-to-local = alloca i32, align 4
  %s0.global-to-local = alloca i32, align 4
  %s1.global-to-local = alloca i32, align 4
  %t9.global-to-local = alloca i32, align 4
  %v0.global-to-local = alloca i32, align 4
  store i32 %arg2, i32* %a1.global-to-local, align 4
  %tmp175 = ptrtoint i32* %arg1 to i32
  store i32 %tmp175, i32* %a0.global-to-local, align 4
  %stack_var_-48 = alloca i32, align 4
  %stack_var_-176 = alloca i32, align 4
  %v2_10010978 = ptrtoint i32* %stack_var_-176 to i32
  %v0_1001097c = load i32, i32* %gp.global-to-local, align 4
  %v0_10010984 = load i32, i32* %s0.global-to-local, align 4
  %v1_10010988 = load i32, i32* %t9.global-to-local, align 4
  %v1_1001098c = add i32 %v1_10010988, 136872
  store i32 %v1_1001098c, i32* %gp.global-to-local, align 4
  %v0_10010990 = load i32, i32* %a0.global-to-local, align 4
  store i32 %v0_10010990, i32* %s0.global-to-local, align 4
  %v1_10010994 = add i32 %v1_10010988, 104128
  %v2_10010994 = inttoptr i32 %v1_10010994 to i32*
  %v3_10010994 = load i32, i32* %v2_10010994, align 4
  store i32 %v3_10010994, i32* %v0.global-to-local, align 4
  %v0_10010998 = load i32, i32* %s1.global-to-local, align 4
  %v1_1001099c = inttoptr i32 %v3_10010994 to i32*
  %v2_1001099c = load i32, i32* %v1_1001099c, align 4
  store i32 %v2_1001099c, i32* %v0.global-to-local, align 4
  %v0_100109a0 = load i32, i32* %ra.global-to-local, align 4
  %v1_100109a4 = add i32 %v2_1001099c, 12
  %v2_100109a4 = inttoptr i32 %v1_100109a4 to i32*
  %v3_100109a4 = load i32, i32* %v2_100109a4, align 4
  store i32 %v3_100109a4, i32* %a0.global-to-local, align 4
  %v1_100109a8 = icmp eq i32 %v3_100109a4, 0
  %v0_100109ac = load i32, i32* %a1.global-to-local, align 4
  store i32 %v0_100109ac, i32* %s1.global-to-local, align 4
  br i1 %v1_100109a8, label %dec_label_pc_10010a0c, label %dec_label_pc_100109b0

dec_label_pc_100109b0:                            ; preds = %dec_label_pc_10010978
  %v1_100109b0 = add i32 %v1_10010988, 104132
  %v2_100109b0 = inttoptr i32 %v1_100109b0 to i32*
  %v3_100109b0 = load i32, i32* %v2_100109b0, align 4
  store i32 %v3_100109b0, i32* %v0.global-to-local, align 4
  %v1_100109b4 = inttoptr i32 %v3_100109b0 to i32*
  %v2_100109b4 = load i32, i32* %v1_100109b4, align 4
  store i32 %v2_100109b4, i32* %v0.global-to-local, align 4
  %v1_100109b8 = add i32 %v2_100109b4, 376
  %v2_100109b8 = inttoptr i32 %v1_100109b8 to i32*
  %v3_100109b8 = load i32, i32* %v2_100109b8, align 4
  %v1_100109bc = icmp slt i32 %v3_100109b8, 4
  %v2_100109bc = zext i1 %v1_100109bc to i32
  store i32 %v2_100109bc, i32* %v0.global-to-local, align 4
  %v3_100109c4 = load i32, i32* %v2_10010994, align 4
  store i32 %v3_100109c4, i32* %v0.global-to-local, align 4
  br i1 %v1_100109bc, label %dec_label_pc_10010a10, label %dec_label_pc_100109c8

dec_label_pc_100109c8:                            ; preds = %dec_label_pc_100109b0
  %v1_100109c8 = add i32 %v1_10010988, 104136
  %v2_100109c8 = inttoptr i32 %v1_100109c8 to i32*
  %v3_100109c8 = load i32, i32* %v2_100109c8, align 4
  store i32 %v3_100109c8, i32* %a1.global-to-local, align 4
  %v1_100109d4 = add i32 %v1_10010988, 104980
  %v2_100109d4 = inttoptr i32 %v1_100109d4 to i32*
  %v3_100109d4 = load i32, i32* %v2_100109d4, align 4
  store i32 %v3_100109d4, i32* %t9.global-to-local, align 4
  %v1_100109d8 = add i32 %v3_100109c8, 26072
  %v2_100109d8 = inttoptr i32 %v1_100109d8 to i8*
  store i32 %v1_100109d8, i32* %a1.global-to-local, align 4
  %v12_100109e0 = call i32 @_fprintf(i32 %v3_100109a4, i8* %v2_100109d8)
  store i32 %v12_100109e0, i32* %v0.global-to-local, align 4
  %v0_100109e4 = load i32, i32* %s0.global-to-local, align 4
  %v1_100109e4 = add i32 %v0_100109e4, 2256
  store i32 %v1_100109e4, i32* %a1.global-to-local, align 4
  %v0_100109e8 = load i32, i32* %gp.global-to-local, align 4
  %v1_100109e8 = add i32 %v0_100109e8, -32736
  %v2_100109e8 = inttoptr i32 %v1_100109e8 to i32*
  %v3_100109e8 = load i32, i32* %v2_100109e8, align 4
  store i32 %v3_100109e8, i32* %a0.global-to-local, align 4
  %v1_100109f0 = add i32 %v0_100109e8, -32732
  %v2_100109f0 = inttoptr i32 %v1_100109f0 to i32*
  %v3_100109f0 = load i32, i32* %v2_100109f0, align 4
  store i32 %v3_100109f0, i32* %t9.global-to-local, align 4
  %v1_100109fc = add i32 %v3_100109e8, 31776
  store i32 %v1_100109fc, i32* %a0.global-to-local, align 4
  %v6_10010a08 = call i32 @httpdLogMessage(i32 %v1_100109fc)
  store i32 %v6_10010a08, i32* %v0.global-to-local, align 4
  %v0_10010a0c.pre = load i32, i32* %gp.global-to-local, align 4
  %v0_10010a10.pre.pre = load i32, i32* %s0.global-to-local, align 4
  br label %dec_label_pc_10010a0c

dec_label_pc_10010a0c:                            ; preds = %dec_label_pc_100109c8, %dec_label_pc_10010978
  %v0_10010a10.pre = phi i32 [ %v0_10010a10.pre.pre, %dec_label_pc_100109c8 ], [ %v0_10010990, %dec_label_pc_10010978 ]
  %v0_10010a0c = phi i32 [ %v0_10010a0c.pre, %dec_label_pc_100109c8 ], [ %v1_1001098c, %dec_label_pc_10010978 ]
  %v1_10010a0c = add i32 %v0_10010a0c, -32744
  %v2_10010a0c = inttoptr i32 %v1_10010a0c to i32*
  %v3_10010a0c = load i32, i32* %v2_10010a0c, align 4
  store i32 %v3_10010a0c, i32* %v0.global-to-local, align 4
  br label %dec_label_pc_10010a10

dec_label_pc_10010a10:                            ; preds = %dec_label_pc_10010a0c, %dec_label_pc_100109b0
  %v0_10010a1c = phi i32 [ %v3_10010a0c, %dec_label_pc_10010a0c ], [ %v3_100109c4, %dec_label_pc_100109b0 ]
  %v0_10010a14 = phi i32 [ %v0_10010a0c, %dec_label_pc_10010a0c ], [ %v1_1001098c, %dec_label_pc_100109b0 ]
  %v0_10010a10 = phi i32 [ %v0_10010a10.pre, %dec_label_pc_10010a0c ], [ %v0_10010990, %dec_label_pc_100109b0 ]
  %v1_10010a10 = add i32 %v0_10010a10, 2512
  %v2_10010a10 = inttoptr i32 %v1_10010a10 to i8*
  store i32 %v1_10010a10, i32* %a0.global-to-local, align 4
  %v1_10010a14 = add i32 %v0_10010a14, -31552
  %v2_10010a14 = inttoptr i32 %v1_10010a14 to i32*
  %v3_10010a14 = load i32, i32* %v2_10010a14, align 4
  store i32 %v3_10010a14, i32* %t9.global-to-local, align 4
  %v2_10010a18 = ptrtoint i32* %stack_var_-48 to i32
  %tmp182 = bitcast i32* %stack_var_-48 to %in_addr*
  store i32 %v2_10010a18, i32* %a1.global-to-local, align 4
  %v1_10010a1c = inttoptr i32 %v0_10010a1c to i32*
  %v2_10010a1c = load i32, i32* %v1_10010a1c, align 4
  store i32 %v2_10010a1c, i32* %v0.global-to-local, align 4
  %v1_10010a24 = add i32 %v2_10010a1c, 76
  %v2_10010a24 = inttoptr i32 %v1_10010a24 to i32*
  store i32 0, i32* %v2_10010a24, align 4
  %v9_10010a24 = call i32 @_inet_aton(i8* %v2_10010a10, %in_addr* %tmp182)
  store i32 %v9_10010a24, i32* %v0.global-to-local, align 4
  %tmp183 = bitcast i32* %stack_var_-176 to i8*
  store i32 %v2_10010978, i32* %a0.global-to-local, align 4
  %v0_10010a2c = load i32, i32* %gp.global-to-local, align 4
  %v1_10010a2c = add i32 %v0_10010a2c, -32736
  %v2_10010a2c = inttoptr i32 %v1_10010a2c to i32*
  %v3_10010a2c = load i32, i32* %v2_10010a2c, align 4
  store i32 %v3_10010a2c, i32* %a1.global-to-local, align 4
  %v1_10010a34 = add i32 %v0_10010a2c, -32080
  %v2_10010a34 = inttoptr i32 %v1_10010a34 to i32*
  %v3_10010a34 = load i32, i32* %v2_10010a34, align 4
  store i32 %v3_10010a34, i32* %t9.global-to-local, align 4
  %v1_10010a38 = add i32 %v3_10010a2c, 31864
  %v2_10010a38 = inttoptr i32 %v1_10010a38 to i8*
  store i32 %v1_10010a38, i32* %a1.global-to-local, align 4
  %v10_10010a44 = call i32 @_sprintf(i8* %tmp183, i8* %v2_10010a38)
  store i32 %v10_10010a44, i32* %v0.global-to-local, align 4
  %v0_10010a48 = load i32, i32* %gp.global-to-local, align 4
  %v1_10010a48 = add i32 %v0_10010a48, -31816
  %v2_10010a48 = inttoptr i32 %v1_10010a48 to i32*
  %v3_10010a48 = load i32, i32* %v2_10010a48, align 4
  store i32 %v3_10010a48, i32* %t9.global-to-local, align 4
  store i32 %v2_10010978, i32* %a0.global-to-local, align 4
  %v6_10010a50 = call i32 @_system(i8* %tmp183)
  store i32 %v6_10010a50, i32* %v0.global-to-local, align 4
  %v0_10010a54 = load i32, i32* %s1.global-to-local, align 4
  %v1_10010a54 = icmp eq i32 %v0_10010a54, 0
  %v0_10010a58 = load i32, i32* %gp.global-to-local, align 4
  %v1_10010a58 = add i32 %v0_10010a58, -32672
  %v2_10010a58 = inttoptr i32 %v1_10010a58 to i32*
  %v3_10010a58 = load i32, i32* %v2_10010a58, align 4
  store i32 %v3_10010a58, i32* %t9.global-to-local, align 4
  br i1 %v1_10010a54, label %dec_label_pc_10010a70, label %dec_label_pc_10010a5c

dec_label_pc_10010a5c:                            ; preds = %dec_label_pc_10010a10
  %v1_10010a5c = add i32 %v0_10010a58, -31944
  %v2_10010a5c = inttoptr i32 %v1_10010a5c to i32*
  %v3_10010a5c = load i32, i32* %v2_10010a5c, align 4
  store i32 %v3_10010a5c, i32* %t9.global-to-local, align 4
  %v0_10010a60 = load i32, i32* %s0.global-to-local, align 4
  %v1_10010a60 = add i32 %v0_10010a60, 2256
  store i32 %v1_10010a60, i32* %a0.global-to-local, align 4
  %v1_10010a68 = add i32 %v0_10010a60, 2244
  %v2_10010a68 = inttoptr i32 %v1_10010a68 to i32*
  %v3_10010a68 = load i32, i32* %v2_10010a68, align 4
  store i32 %v3_10010a68, i32* %a1.global-to-local, align 4
  %v6_10010a68 = call i32 @_sessionUnRegisterApi(i32 %v1_10010a60, i32 %v3_10010a68)
  store i32 %v6_10010a68, i32* %v0.global-to-local, align 4
  %v0_10010a6c = load i32, i32* %gp.global-to-local, align 4
  %v1_10010a6c = add i32 %v0_10010a6c, -32672
  %v2_10010a6c = inttoptr i32 %v1_10010a6c to i32*
  %v3_10010a6c = load i32, i32* %v2_10010a6c, align 4
  store i32 %v3_10010a6c, i32* %t9.global-to-local, align 4
  br label %dec_label_pc_10010a70

dec_label_pc_10010a70:                            ; preds = %dec_label_pc_10010a5c, %dec_label_pc_10010a10
  %v0_10010a74 = load i32, i32* %s0.global-to-local, align 4
  store i32 %v0_10010a74, i32* %a0.global-to-local, align 4
  %v2_10010a74 = call i32 @httpdErrorLog(i32 %v0_10010a74)
  store i32 %v2_10010a74, i32* %v0.global-to-local, align 4
  %v0_10010a78 = load i32, i32* %gp.global-to-local, align 4
  %v1_10010a78 = add i32 %v0_10010a78, -32744
  %v2_10010a78 = inttoptr i32 %v1_10010a78 to i32*
  %v3_10010a78 = load i32, i32* %v2_10010a78, align 4
  store i32 %v3_10010a78, i32* %v0.global-to-local, align 4
  %v1_10010a7c = inttoptr i32 %v3_10010a78 to i32*
  %v2_10010a7c = load i32, i32* %v1_10010a7c, align 4
  store i32 %v2_10010a7c, i32* %v0.global-to-local, align 4
  %v1_10010a80 = add i32 %v2_10010a7c, 12
  %v2_10010a80 = inttoptr i32 %v1_10010a80 to i32*
  %v3_10010a80 = load i32, i32* %v2_10010a80, align 4
  store i32 %v3_10010a80, i32* %a0.global-to-local, align 4
  %v1_10010a84 = icmp eq i32 %v3_10010a80, 0
  %v1_10010a88 = add i32 %v0_10010a78, -32740
  %v2_10010a88 = inttoptr i32 %v1_10010a88 to i32*
  %v3_10010a88 = load i32, i32* %v2_10010a88, align 4
  store i32 %v3_10010a88, i32* %v0.global-to-local, align 4
  br i1 %v1_10010a84, label %dec_label_pc_10010acc, label %dec_label_pc_10010a8c

dec_label_pc_10010a8c:                            ; preds = %dec_label_pc_10010a70
  %v1_10010a8c = inttoptr i32 %v3_10010a88 to i32*
  %v2_10010a8c = load i32, i32* %v1_10010a8c, align 4
  store i32 %v2_10010a8c, i32* %v0.global-to-local, align 4
  %v1_10010a90 = add i32 %v2_10010a8c, 376
  %v2_10010a90 = inttoptr i32 %v1_10010a90 to i32*
  %v3_10010a90 = load i32, i32* %v2_10010a90, align 4
  %v1_10010a94 = icmp slt i32 %v3_10010a90, 3
  %v2_10010a94 = zext i1 %v1_10010a94 to i32
  store i32 %v2_10010a94, i32* %v0.global-to-local, align 4
  %v1_10010a9c = add i32 %v0_10010a78, -32508
  %v2_10010a9c = inttoptr i32 %v1_10010a9c to i32*
  %v3_10010a9c = load i32, i32* %v2_10010a9c, align 4
  store i32 %v3_10010a9c, i32* %t9.global-to-local, align 4
  br i1 %v1_10010a94, label %dec_label_pc_10010ad0, label %dec_label_pc_10010aa0

dec_label_pc_10010aa0:                            ; preds = %dec_label_pc_10010a8c
  %v1_10010aa0 = add i32 %v0_10010a78, -32736
  %v2_10010aa0 = inttoptr i32 %v1_10010aa0 to i32*
  %v3_10010aa0 = load i32, i32* %v2_10010aa0, align 4
  store i32 %v3_10010aa0, i32* %a1.global-to-local, align 4
  %v1_10010aac = add i32 %v0_10010a78, -31892
  %v2_10010aac = inttoptr i32 %v1_10010aac to i32*
  %v3_10010aac = load i32, i32* %v2_10010aac, align 4
  store i32 %v3_10010aac, i32* %t9.global-to-local, align 4
  %v1_10010ab0 = add i32 %v3_10010aa0, 22952
  %v2_10010ab0 = inttoptr i32 %v1_10010ab0 to i8*
  store i32 %v1_10010ab0, i32* %a1.global-to-local, align 4
  %v8_10010ab8 = call i32 @_fprintf(i32 %v3_10010a80, i8* %v2_10010ab0)
  store i32 %v8_10010ab8, i32* %v0.global-to-local, align 4
  %v0_10010abc = load i32, i32* %gp.global-to-local, align 4
  %v1_10010abc = add i32 %v0_10010abc, -32736
  %v2_10010abc = inttoptr i32 %v1_10010abc to i32*
  %v3_10010abc = load i32, i32* %v2_10010abc, align 4
  store i32 %v3_10010abc, i32* %a0.global-to-local, align 4
  %v1_10010ac0 = add i32 %v0_10010abc, -32732
  %v2_10010ac0 = inttoptr i32 %v1_10010ac0 to i32*
  %v3_10010ac0 = load i32, i32* %v2_10010ac0, align 4
  store i32 %v3_10010ac0, i32* %t9.global-to-local, align 4
  %v1_10010ac8 = add i32 %v3_10010abc, 31896
  store i32 %v1_10010ac8, i32* %a0.global-to-local, align 4
  %v3_10010ac8 = call i32 @httpdLogMessage(i32 %v1_10010ac8)
  store i32 %v3_10010ac8, i32* %v0.global-to-local, align 4
  %v0_10010acc.pre = load i32, i32* %gp.global-to-local, align 4
  br label %dec_label_pc_10010acc

dec_label_pc_10010acc:                            ; preds = %dec_label_pc_10010aa0, %dec_label_pc_10010a70
  %v0_10010acc = phi i32 [ %v0_10010acc.pre, %dec_label_pc_10010aa0 ], [ %v0_10010a78, %dec_label_pc_10010a70 ]
  %v1_10010acc = add i32 %v0_10010acc, -32508
  %v2_10010acc = inttoptr i32 %v1_10010acc to i32*
  %v3_10010acc = load i32, i32* %v2_10010acc, align 4
  store i32 %v3_10010acc, i32* %t9.global-to-local, align 4
  br label %dec_label_pc_10010ad0

dec_label_pc_10010ad0:                            ; preds = %dec_label_pc_10010acc, %dec_label_pc_10010a8c
  %v0_10010ad4 = load i32, i32* %s0.global-to-local, align 4
  store i32 %v0_10010ad4, i32* %a0.global-to-local, align 4
  %v2_10010ad4 = call i32 @httpdAccessLog(i32 %v0_10010ad4)
  store i32 %v2_10010ad4, i32* %v0.global-to-local, align 4
  store i32 2, i32* %a1.global-to-local, align 4
  %v0_10010adc = load i32, i32* %gp.global-to-local, align 4
  %v1_10010adc = add i32 %v0_10010adc, -32168
  %v2_10010adc = inttoptr i32 %v1_10010adc to i32*
  %v3_10010adc = load i32, i32* %v2_10010adc, align 4
  store i32 %v3_10010adc, i32* %t9.global-to-local, align 4
  store i32 %v0_10010ad4, i32* %a0.global-to-local, align 4
  %v5_10010ae4 = call i32 @_shutdown(i32 %v0_10010ad4, i32 2)
  store i32 %v5_10010ae4, i32* %v0.global-to-local, align 4
  %v0_10010ae8 = load i32, i32* %gp.global-to-local, align 4
  %v1_10010ae8 = add i32 %v0_10010ae8, -32192
  %v2_10010ae8 = inttoptr i32 %v1_10010ae8 to i32*
  %v3_10010ae8 = load i32, i32* %v2_10010ae8, align 4
  store i32 %v3_10010ae8, i32* %t9.global-to-local, align 4
  %v0_10010af0 = load i32, i32* %s0.global-to-local, align 4
  %v1_10010af0 = add i32 %v0_10010af0, 2244
  %v2_10010af0 = inttoptr i32 %v1_10010af0 to i32*
  %v3_10010af0 = load i32, i32* %v2_10010af0, align 4
  store i32 %v3_10010af0, i32* %a0.global-to-local, align 4
  %v5_10010af0 = call i32 @_close(i32 %v3_10010af0)
  store i32 %v5_10010af0, i32* %v0.global-to-local, align 4
  %v0_10010af4 = load i32, i32* %s0.global-to-local, align 4
  %v1_10010af4 = add i32 %v0_10010af4, 2784
  %v2_10010af4 = inttoptr i32 %v1_10010af4 to i32*
  %v3_10010af4 = load i32, i32* %v2_10010af4, align 4
  store i32 %v3_10010af4, i32* %a0.global-to-local, align 4
  %v1_10010af8 = icmp eq i32 %v3_10010af4, 0
  store i32 %v0_100109a0, i32* %ra.global-to-local, align 4
  br i1 %v1_10010af8, label %dec_label_pc_10010b10, label %dec_label_pc_10010b00

dec_label_pc_10010b00:                            ; preds = %dec_label_pc_10010ad0
  %v0_10010b00 = load i32, i32* %gp.global-to-local, align 4
  %v1_10010b00 = add i32 %v0_10010b00, -31836
  %v2_10010b00 = inttoptr i32 %v1_10010b00 to i32*
  %v3_10010b00 = load i32, i32* %v2_10010b00, align 4
  store i32 %v3_10010b00, i32* %t9.global-to-local, align 4
  store i32 2, i32* %a1.global-to-local, align 4
  %v2_10010b08 = call i32 @_kill(i32 %v3_10010af4, i32 2)
  store i32 %v2_10010b08, i32* %v0.global-to-local, align 4
  store i32 %v0_100109a0, i32* %ra.global-to-local, align 4
  %v1_10010b14.pre = load i32, i32* %s0.global-to-local, align 4
  br label %dec_label_pc_10010b10

dec_label_pc_10010b10:                            ; preds = %dec_label_pc_10010b00, %dec_label_pc_10010ad0
  %v1_10010b14 = phi i32 [ %v1_10010b14.pre, %dec_label_pc_10010b00 ], [ %v0_10010af4, %dec_label_pc_10010ad0 ]
  %v2_10010b14 = add i32 %v1_10010b14, 8
  %v3_10010b14 = inttoptr i32 %v2_10010b14 to i32*
  store i32 14, i32* %v3_10010b14, align 4
  store i32 1, i32* %v0.global-to-local, align 4
  store i32 %v0_1001097c, i32* %gp.global-to-local, align 4
  store i32 %v0_10010998, i32* %s1.global-to-local, align 4
  %v0_10010b24 = load i32, i32* %s0.global-to-local, align 4
  %v1_10010b24 = add i32 %v0_10010b24, 2244
  %v2_10010b24 = inttoptr i32 %v1_10010b24 to i32*
  store i32 0, i32* %v2_10010b24, align 4
  %v0_10010b28 = load i32, i32* %v0.global-to-local, align 4
  %v1_10010b28 = load i32, i32* %s0.global-to-local, align 4
  %v2_10010b28 = add i32 %v1_10010b28, 24
  %v3_10010b28 = inttoptr i32 %v2_10010b28 to i32*
  store i32 %v0_10010b28, i32* %v3_10010b28, align 4
  store i32 %v0_10010984, i32* %s0.global-to-local, align 4
  %v0_10010b30 = load i32, i32* %v0.global-to-local, align 4
  ret i32 %v0_10010b30

; uselistorder directives
  uselistorder i32 %v0_10010ad4, { 1, 0, 2, 3 }
  uselistorder i32 %v1_10010ab0, { 1, 0 }
  uselistorder i32 %v1_10010a38, { 1, 0 }
  uselistorder i8* %tmp183, { 1, 0 }
  uselistorder i32 %v1_10010a10, { 1, 0 }
  uselistorder i32 %v1_100109d8, { 1, 0 }
  uselistorder i32 %v0_10010990, { 1, 0, 2 }
  uselistorder i32* %v0.global-to-local, { 2, 1, 3, 0, 5, 6, 7, 8, 4, 9, 17, 10, 14, 11, 12, 16, 13, 15, 19, 20, 18, 21, 25, 22, 24, 26, 23, 27, 28 }
  uselistorder i32* %t9.global-to-local, { 0, 1, 4, 3, 7, 2, 6, 8, 10, 11, 9, 12, 13, 14, 15, 5 }
  uselistorder i32* %s1.global-to-local, { 1, 2, 3, 0 }
  uselistorder i32* %s0.global-to-local, { 1, 3, 2, 8, 4, 5, 9, 10, 7, 6, 11, 12, 0 }
  uselistorder i32* %ra.global-to-local, { 1, 0, 2 }
  uselistorder i32* %gp.global-to-local, { 0, 2, 4, 6, 5, 3, 10, 11, 9, 7, 8, 13, 12, 14, 1 }
  uselistorder i32* %a1.global-to-local, { 2, 3, 5, 4, 6, 7, 8, 9, 10, 12, 11, 0, 1 }
  uselistorder i32* %a0.global-to-local, { 2, 3, 6, 7, 4, 5, 11, 8, 9, 10, 12, 14, 15, 13, 16, 0, 1 }
  uselistorder i32 2, { 1, 2, 0, 3 }
  uselistorder i32 (i32)* @httpdLogMessage, { 1, 0 }
  uselistorder i32 (i32, i8*)* @_fprintf, { 1, 0 }
  uselistorder i32 1, { 10, 9, 8, 7, 4, 3, 5, 0, 6, 2, 1 }
}

declare i32 @_inet_aton(i8*, %in_addr*) local_unnamed_addr

declare i32 @_system(i8*) local_unnamed_addr

declare i32 @_kill(i32, i32) local_unnamed_addr

declare i32 @_fprintf(i32, i8*) local_unnamed_addr

declare i32 @_sessionUnRegisterApi(i32, i32) local_unnamed_addr

declare i32 @_sprintf(i8*, i8*) local_unnamed_addr

declare i32 @_shutdown(i32, i32) local_unnamed_addr

declare i32 @_close(i32) local_unnamed_addr
