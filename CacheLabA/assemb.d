
assemb:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 a2 2f 00 00    	push   0x2fa2(%rip)        # 3fc8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 a3 2f 00 00 	bnd jmp *0x2fa3(%rip)        # 3fd0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)

Disassembly of section .plt.got:

0000000000001030 <__cxa_finalize@plt>:
    1030:	f3 0f 1e fa          	endbr64 
    1034:	f2 ff 25 bd 2f 00 00 	bnd jmp *0x2fbd(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    103b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001040 <_start>:
    1040:	f3 0f 1e fa          	endbr64 
    1044:	31 ed                	xor    %ebp,%ebp
    1046:	49 89 d1             	mov    %rdx,%r9
    1049:	5e                   	pop    %rsi
    104a:	48 89 e2             	mov    %rsp,%rdx
    104d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1051:	50                   	push   %rax
    1052:	54                   	push   %rsp
    1053:	45 31 c0             	xor    %r8d,%r8d
    1056:	31 c9                	xor    %ecx,%ecx
    1058:	48 8d 3d 00 0f 00 00 	lea    0xf00(%rip),%rdi        # 1f5f <main>
    105f:	ff 15 73 2f 00 00    	call   *0x2f73(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1065:	f4                   	hlt    
    1066:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    106d:	00 00 00 

0000000000001070 <deregister_tm_clones>:
    1070:	48 8d 3d 99 2f 00 00 	lea    0x2f99(%rip),%rdi        # 4010 <__TMC_END__>
    1077:	48 8d 05 92 2f 00 00 	lea    0x2f92(%rip),%rax        # 4010 <__TMC_END__>
    107e:	48 39 f8             	cmp    %rdi,%rax
    1081:	74 15                	je     1098 <deregister_tm_clones+0x28>
    1083:	48 8b 05 56 2f 00 00 	mov    0x2f56(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    108a:	48 85 c0             	test   %rax,%rax
    108d:	74 09                	je     1098 <deregister_tm_clones+0x28>
    108f:	ff e0                	jmp    *%rax
    1091:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1098:	c3                   	ret    
    1099:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010a0 <register_tm_clones>:
    10a0:	48 8d 3d 69 2f 00 00 	lea    0x2f69(%rip),%rdi        # 4010 <__TMC_END__>
    10a7:	48 8d 35 62 2f 00 00 	lea    0x2f62(%rip),%rsi        # 4010 <__TMC_END__>
    10ae:	48 29 fe             	sub    %rdi,%rsi
    10b1:	48 89 f0             	mov    %rsi,%rax
    10b4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10b8:	48 c1 f8 03          	sar    $0x3,%rax
    10bc:	48 01 c6             	add    %rax,%rsi
    10bf:	48 d1 fe             	sar    %rsi
    10c2:	74 14                	je     10d8 <register_tm_clones+0x38>
    10c4:	48 8b 05 25 2f 00 00 	mov    0x2f25(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    10cb:	48 85 c0             	test   %rax,%rax
    10ce:	74 08                	je     10d8 <register_tm_clones+0x38>
    10d0:	ff e0                	jmp    *%rax
    10d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    10d8:	c3                   	ret    
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010e0 <__do_global_dtors_aux>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	80 3d 25 2f 00 00 00 	cmpb   $0x0,0x2f25(%rip)        # 4010 <__TMC_END__>
    10eb:	75 2b                	jne    1118 <__do_global_dtors_aux+0x38>
    10ed:	55                   	push   %rbp
    10ee:	48 83 3d 02 2f 00 00 	cmpq   $0x0,0x2f02(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    10f5:	00 
    10f6:	48 89 e5             	mov    %rsp,%rbp
    10f9:	74 0c                	je     1107 <__do_global_dtors_aux+0x27>
    10fb:	48 8b 3d 06 2f 00 00 	mov    0x2f06(%rip),%rdi        # 4008 <__dso_handle>
    1102:	e8 29 ff ff ff       	call   1030 <__cxa_finalize@plt>
    1107:	e8 64 ff ff ff       	call   1070 <deregister_tm_clones>
    110c:	c6 05 fd 2e 00 00 01 	movb   $0x1,0x2efd(%rip)        # 4010 <__TMC_END__>
    1113:	5d                   	pop    %rbp
    1114:	c3                   	ret    
    1115:	0f 1f 00             	nopl   (%rax)
    1118:	c3                   	ret    
    1119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001120 <frame_dummy>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	e9 77 ff ff ff       	jmp    10a0 <register_tm_clones>

0000000000001129 <transpose_submit>:
    1129:	f3 0f 1e fa          	endbr64 
    112d:	55                   	push   %rbp
    112e:	48 89 e5             	mov    %rsp,%rbp
    1131:	41 57                	push   %r15
    1133:	41 56                	push   %r14
    1135:	41 55                	push   %r13
    1137:	41 54                	push   %r12
    1139:	53                   	push   %rbx
    113a:	89 7d bc             	mov    %edi,-0x44(%rbp)
    113d:	89 75 b8             	mov    %esi,-0x48(%rbp)
    1140:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
    1144:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    1148:	8b 55 bc             	mov    -0x44(%rbp),%edx
    114b:	48 63 c2             	movslq %edx,%rax
    114e:	48 83 e8 01          	sub    $0x1,%rax
    1152:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1156:	48 63 c2             	movslq %edx,%rax
    1159:	49 89 c2             	mov    %rax,%r10
    115c:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    1162:	8b 45 b8             	mov    -0x48(%rbp),%eax
    1165:	48 63 c8             	movslq %eax,%rcx
    1168:	48 83 e9 01          	sub    $0x1,%rcx
    116c:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    1170:	48 63 c8             	movslq %eax,%rcx
    1173:	49 89 c8             	mov    %rcx,%r8
    1176:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    117c:	83 7d bc 20          	cmpl   $0x20,-0x44(%rbp)
    1180:	0f 85 a0 02 00 00    	jne    1426 <transpose_submit+0x2fd>
    1186:	83 7d b8 20          	cmpl   $0x20,-0x48(%rbp)
    118a:	0f 85 96 02 00 00    	jne    1426 <transpose_submit+0x2fd>
    1190:	41 be 00 00 00 00    	mov    $0x0,%r14d
    1196:	e9 7c 02 00 00       	jmp    1417 <transpose_submit+0x2ee>
    119b:	41 bc 00 00 00 00    	mov    $0x0,%r12d
    11a1:	e9 63 02 00 00       	jmp    1409 <transpose_submit+0x2e0>
    11a6:	44 89 f3             	mov    %r14d,%ebx
    11a9:	e9 4b 02 00 00       	jmp    13f9 <transpose_submit+0x2d0>
    11ae:	48 63 f3             	movslq %ebx,%rsi
    11b1:	48 63 ca             	movslq %edx,%rcx
    11b4:	48 0f af ce          	imul   %rsi,%rcx
    11b8:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    11bf:	00 
    11c0:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    11c4:	48 01 ce             	add    %rcx,%rsi
    11c7:	49 63 cc             	movslq %r12d,%rcx
    11ca:	8b 3c 8e             	mov    (%rsi,%rcx,4),%edi
    11cd:	48 63 f3             	movslq %ebx,%rsi
    11d0:	48 63 ca             	movslq %edx,%rcx
    11d3:	48 0f af ce          	imul   %rsi,%rcx
    11d7:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    11de:	00 
    11df:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    11e3:	48 01 ce             	add    %rcx,%rsi
    11e6:	41 8d 4c 24 01       	lea    0x1(%r12),%ecx
    11eb:	48 63 c9             	movslq %ecx,%rcx
    11ee:	44 8b 0c 8e          	mov    (%rsi,%rcx,4),%r9d
    11f2:	48 63 f3             	movslq %ebx,%rsi
    11f5:	48 63 ca             	movslq %edx,%rcx
    11f8:	48 0f af ce          	imul   %rsi,%rcx
    11fc:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1203:	00 
    1204:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1208:	48 01 ce             	add    %rcx,%rsi
    120b:	41 8d 4c 24 02       	lea    0x2(%r12),%ecx
    1210:	48 63 c9             	movslq %ecx,%rcx
    1213:	44 8b 1c 8e          	mov    (%rsi,%rcx,4),%r11d
    1217:	48 63 f3             	movslq %ebx,%rsi
    121a:	48 63 ca             	movslq %edx,%rcx
    121d:	48 0f af ce          	imul   %rsi,%rcx
    1221:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1228:	00 
    1229:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    122d:	48 01 ce             	add    %rcx,%rsi
    1230:	41 8d 4c 24 03       	lea    0x3(%r12),%ecx
    1235:	48 63 c9             	movslq %ecx,%rcx
    1238:	44 8b 3c 8e          	mov    (%rsi,%rcx,4),%r15d
    123c:	48 63 f3             	movslq %ebx,%rsi
    123f:	48 63 ca             	movslq %edx,%rcx
    1242:	48 0f af ce          	imul   %rsi,%rcx
    1246:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    124d:	00 
    124e:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1252:	48 01 ce             	add    %rcx,%rsi
    1255:	41 8d 4c 24 04       	lea    0x4(%r12),%ecx
    125a:	48 63 c9             	movslq %ecx,%rcx
    125d:	44 8b 04 8e          	mov    (%rsi,%rcx,4),%r8d
    1261:	48 63 f3             	movslq %ebx,%rsi
    1264:	48 63 ca             	movslq %edx,%rcx
    1267:	48 0f af ce          	imul   %rsi,%rcx
    126b:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1272:	00 
    1273:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1277:	48 01 ce             	add    %rcx,%rsi
    127a:	41 8d 4c 24 05       	lea    0x5(%r12),%ecx
    127f:	48 63 c9             	movslq %ecx,%rcx
    1282:	44 8b 14 8e          	mov    (%rsi,%rcx,4),%r10d
    1286:	48 63 f3             	movslq %ebx,%rsi
    1289:	48 63 ca             	movslq %edx,%rcx
    128c:	48 0f af ce          	imul   %rsi,%rcx
    1290:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1297:	00 
    1298:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    129c:	48 01 ce             	add    %rcx,%rsi
    129f:	41 8d 4c 24 06       	lea    0x6(%r12),%ecx
    12a4:	48 63 c9             	movslq %ecx,%rcx
    12a7:	44 8b 2c 8e          	mov    (%rsi,%rcx,4),%r13d
    12ab:	48 63 f3             	movslq %ebx,%rsi
    12ae:	48 63 ca             	movslq %edx,%rcx
    12b1:	48 0f af ce          	imul   %rsi,%rcx
    12b5:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    12bc:	00 
    12bd:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    12c1:	48 01 ce             	add    %rcx,%rsi
    12c4:	41 8d 4c 24 07       	lea    0x7(%r12),%ecx
    12c9:	48 63 c9             	movslq %ecx,%rcx
    12cc:	8b 34 8e             	mov    (%rsi,%rcx,4),%esi
    12cf:	89 75 a4             	mov    %esi,-0x5c(%rbp)
    12d2:	49 63 f4             	movslq %r12d,%rsi
    12d5:	48 63 c8             	movslq %eax,%rcx
    12d8:	48 0f af ce          	imul   %rsi,%rcx
    12dc:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    12e3:	00 
    12e4:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    12e8:	48 01 ce             	add    %rcx,%rsi
    12eb:	48 63 cb             	movslq %ebx,%rcx
    12ee:	89 3c 8e             	mov    %edi,(%rsi,%rcx,4)
    12f1:	41 8d 4c 24 01       	lea    0x1(%r12),%ecx
    12f6:	48 63 f1             	movslq %ecx,%rsi
    12f9:	48 63 c8             	movslq %eax,%rcx
    12fc:	48 0f af ce          	imul   %rsi,%rcx
    1300:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1307:	00 
    1308:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    130c:	48 01 ce             	add    %rcx,%rsi
    130f:	48 63 cb             	movslq %ebx,%rcx
    1312:	44 89 0c 8e          	mov    %r9d,(%rsi,%rcx,4)
    1316:	41 8d 4c 24 02       	lea    0x2(%r12),%ecx
    131b:	48 63 f1             	movslq %ecx,%rsi
    131e:	48 63 c8             	movslq %eax,%rcx
    1321:	48 0f af ce          	imul   %rsi,%rcx
    1325:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    132c:	00 
    132d:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1331:	48 01 ce             	add    %rcx,%rsi
    1334:	48 63 cb             	movslq %ebx,%rcx
    1337:	44 89 1c 8e          	mov    %r11d,(%rsi,%rcx,4)
    133b:	41 8d 4c 24 03       	lea    0x3(%r12),%ecx
    1340:	48 63 f1             	movslq %ecx,%rsi
    1343:	48 63 c8             	movslq %eax,%rcx
    1346:	48 0f af ce          	imul   %rsi,%rcx
    134a:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1351:	00 
    1352:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1356:	48 01 ce             	add    %rcx,%rsi
    1359:	48 63 cb             	movslq %ebx,%rcx
    135c:	44 89 3c 8e          	mov    %r15d,(%rsi,%rcx,4)
    1360:	41 8d 4c 24 04       	lea    0x4(%r12),%ecx
    1365:	48 63 f1             	movslq %ecx,%rsi
    1368:	48 63 c8             	movslq %eax,%rcx
    136b:	48 0f af ce          	imul   %rsi,%rcx
    136f:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1376:	00 
    1377:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    137b:	48 01 ce             	add    %rcx,%rsi
    137e:	48 63 cb             	movslq %ebx,%rcx
    1381:	44 89 04 8e          	mov    %r8d,(%rsi,%rcx,4)
    1385:	41 8d 4c 24 05       	lea    0x5(%r12),%ecx
    138a:	48 63 f1             	movslq %ecx,%rsi
    138d:	48 63 c8             	movslq %eax,%rcx
    1390:	48 0f af ce          	imul   %rsi,%rcx
    1394:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    139b:	00 
    139c:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    13a0:	48 01 ce             	add    %rcx,%rsi
    13a3:	48 63 cb             	movslq %ebx,%rcx
    13a6:	44 89 14 8e          	mov    %r10d,(%rsi,%rcx,4)
    13aa:	41 8d 4c 24 06       	lea    0x6(%r12),%ecx
    13af:	48 63 f1             	movslq %ecx,%rsi
    13b2:	48 63 c8             	movslq %eax,%rcx
    13b5:	48 0f af ce          	imul   %rsi,%rcx
    13b9:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    13c0:	00 
    13c1:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    13c5:	48 01 ce             	add    %rcx,%rsi
    13c8:	48 63 cb             	movslq %ebx,%rcx
    13cb:	44 89 2c 8e          	mov    %r13d,(%rsi,%rcx,4)
    13cf:	41 8d 4c 24 07       	lea    0x7(%r12),%ecx
    13d4:	48 63 f1             	movslq %ecx,%rsi
    13d7:	48 63 c8             	movslq %eax,%rcx
    13da:	48 0f af ce          	imul   %rsi,%rcx
    13de:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    13e5:	00 
    13e6:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    13ea:	48 01 ce             	add    %rcx,%rsi
    13ed:	48 63 cb             	movslq %ebx,%rcx
    13f0:	8b 7d a4             	mov    -0x5c(%rbp),%edi
    13f3:	89 3c 8e             	mov    %edi,(%rsi,%rcx,4)
    13f6:	83 c3 01             	add    $0x1,%ebx
    13f9:	41 8d 4e 07          	lea    0x7(%r14),%ecx
    13fd:	39 cb                	cmp    %ecx,%ebx
    13ff:	0f 8e a9 fd ff ff    	jle    11ae <transpose_submit+0x85>
    1405:	41 83 c4 08          	add    $0x8,%r12d
    1409:	44 3b 65 b8          	cmp    -0x48(%rbp),%r12d
    140d:	0f 8c 93 fd ff ff    	jl     11a6 <transpose_submit+0x7d>
    1413:	41 83 c6 08          	add    $0x8,%r14d
    1417:	44 3b 75 bc          	cmp    -0x44(%rbp),%r14d
    141b:	0f 8c 7a fd ff ff    	jl     119b <transpose_submit+0x72>
    1421:	e9 e4 06 00 00       	jmp    1b0a <transpose_submit+0x9e1>
    1426:	83 7d b8 40          	cmpl   $0x40,-0x48(%rbp)
    142a:	0f 85 41 06 00 00    	jne    1a71 <transpose_submit+0x948>
    1430:	41 be 00 00 00 00    	mov    $0x0,%r14d
    1436:	e9 27 06 00 00       	jmp    1a62 <transpose_submit+0x939>
    143b:	41 bc 00 00 00 00    	mov    $0x0,%r12d
    1441:	e9 0e 06 00 00       	jmp    1a54 <transpose_submit+0x92b>
    1446:	44 89 f3             	mov    %r14d,%ebx
    1449:	e9 52 02 00 00       	jmp    16a0 <transpose_submit+0x577>
    144e:	48 63 f3             	movslq %ebx,%rsi
    1451:	48 63 ca             	movslq %edx,%rcx
    1454:	48 0f af ce          	imul   %rsi,%rcx
    1458:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    145f:	00 
    1460:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1464:	48 01 ce             	add    %rcx,%rsi
    1467:	49 63 cc             	movslq %r12d,%rcx
    146a:	8b 3c 8e             	mov    (%rsi,%rcx,4),%edi
    146d:	48 63 f3             	movslq %ebx,%rsi
    1470:	48 63 ca             	movslq %edx,%rcx
    1473:	48 0f af ce          	imul   %rsi,%rcx
    1477:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    147e:	00 
    147f:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1483:	48 01 ce             	add    %rcx,%rsi
    1486:	41 8d 4c 24 01       	lea    0x1(%r12),%ecx
    148b:	48 63 c9             	movslq %ecx,%rcx
    148e:	44 8b 0c 8e          	mov    (%rsi,%rcx,4),%r9d
    1492:	48 63 f3             	movslq %ebx,%rsi
    1495:	48 63 ca             	movslq %edx,%rcx
    1498:	48 0f af ce          	imul   %rsi,%rcx
    149c:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    14a3:	00 
    14a4:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    14a8:	48 01 ce             	add    %rcx,%rsi
    14ab:	41 8d 4c 24 02       	lea    0x2(%r12),%ecx
    14b0:	48 63 c9             	movslq %ecx,%rcx
    14b3:	44 8b 1c 8e          	mov    (%rsi,%rcx,4),%r11d
    14b7:	48 63 f3             	movslq %ebx,%rsi
    14ba:	48 63 ca             	movslq %edx,%rcx
    14bd:	48 0f af ce          	imul   %rsi,%rcx
    14c1:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    14c8:	00 
    14c9:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    14cd:	48 01 ce             	add    %rcx,%rsi
    14d0:	41 8d 4c 24 03       	lea    0x3(%r12),%ecx
    14d5:	48 63 c9             	movslq %ecx,%rcx
    14d8:	44 8b 3c 8e          	mov    (%rsi,%rcx,4),%r15d
    14dc:	48 63 f3             	movslq %ebx,%rsi
    14df:	48 63 ca             	movslq %edx,%rcx
    14e2:	48 0f af ce          	imul   %rsi,%rcx
    14e6:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    14ed:	00 
    14ee:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    14f2:	48 01 ce             	add    %rcx,%rsi
    14f5:	41 8d 4c 24 04       	lea    0x4(%r12),%ecx
    14fa:	48 63 c9             	movslq %ecx,%rcx
    14fd:	44 8b 04 8e          	mov    (%rsi,%rcx,4),%r8d
    1501:	48 63 f3             	movslq %ebx,%rsi
    1504:	48 63 ca             	movslq %edx,%rcx
    1507:	48 0f af ce          	imul   %rsi,%rcx
    150b:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1512:	00 
    1513:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1517:	48 01 ce             	add    %rcx,%rsi
    151a:	41 8d 4c 24 05       	lea    0x5(%r12),%ecx
    151f:	48 63 c9             	movslq %ecx,%rcx
    1522:	44 8b 14 8e          	mov    (%rsi,%rcx,4),%r10d
    1526:	48 63 f3             	movslq %ebx,%rsi
    1529:	48 63 ca             	movslq %edx,%rcx
    152c:	48 0f af ce          	imul   %rsi,%rcx
    1530:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1537:	00 
    1538:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    153c:	48 01 ce             	add    %rcx,%rsi
    153f:	41 8d 4c 24 06       	lea    0x6(%r12),%ecx
    1544:	48 63 c9             	movslq %ecx,%rcx
    1547:	44 8b 2c 8e          	mov    (%rsi,%rcx,4),%r13d
    154b:	48 63 f3             	movslq %ebx,%rsi
    154e:	48 63 ca             	movslq %edx,%rcx
    1551:	48 0f af ce          	imul   %rsi,%rcx
    1555:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    155c:	00 
    155d:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1561:	48 01 ce             	add    %rcx,%rsi
    1564:	41 8d 4c 24 07       	lea    0x7(%r12),%ecx
    1569:	48 63 c9             	movslq %ecx,%rcx
    156c:	8b 34 8e             	mov    (%rsi,%rcx,4),%esi
    156f:	89 75 a4             	mov    %esi,-0x5c(%rbp)
    1572:	49 63 f4             	movslq %r12d,%rsi
    1575:	48 63 c8             	movslq %eax,%rcx
    1578:	48 0f af ce          	imul   %rsi,%rcx
    157c:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1583:	00 
    1584:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1588:	48 01 ce             	add    %rcx,%rsi
    158b:	48 63 cb             	movslq %ebx,%rcx
    158e:	89 3c 8e             	mov    %edi,(%rsi,%rcx,4)
    1591:	41 8d 4c 24 01       	lea    0x1(%r12),%ecx
    1596:	48 63 f1             	movslq %ecx,%rsi
    1599:	48 63 c8             	movslq %eax,%rcx
    159c:	48 0f af ce          	imul   %rsi,%rcx
    15a0:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    15a7:	00 
    15a8:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    15ac:	48 01 ce             	add    %rcx,%rsi
    15af:	48 63 cb             	movslq %ebx,%rcx
    15b2:	44 89 0c 8e          	mov    %r9d,(%rsi,%rcx,4)
    15b6:	41 8d 4c 24 02       	lea    0x2(%r12),%ecx
    15bb:	48 63 f1             	movslq %ecx,%rsi
    15be:	48 63 c8             	movslq %eax,%rcx
    15c1:	48 0f af ce          	imul   %rsi,%rcx
    15c5:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    15cc:	00 
    15cd:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    15d1:	48 01 ce             	add    %rcx,%rsi
    15d4:	48 63 cb             	movslq %ebx,%rcx
    15d7:	44 89 1c 8e          	mov    %r11d,(%rsi,%rcx,4)
    15db:	41 8d 4c 24 03       	lea    0x3(%r12),%ecx
    15e0:	48 63 f1             	movslq %ecx,%rsi
    15e3:	48 63 c8             	movslq %eax,%rcx
    15e6:	48 0f af ce          	imul   %rsi,%rcx
    15ea:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    15f1:	00 
    15f2:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    15f6:	48 01 ce             	add    %rcx,%rsi
    15f9:	48 63 cb             	movslq %ebx,%rcx
    15fc:	44 89 3c 8e          	mov    %r15d,(%rsi,%rcx,4)
    1600:	49 63 f4             	movslq %r12d,%rsi
    1603:	48 63 c8             	movslq %eax,%rcx
    1606:	48 0f af ce          	imul   %rsi,%rcx
    160a:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1611:	00 
    1612:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1616:	48 01 ce             	add    %rcx,%rsi
    1619:	8d 4b 04             	lea    0x4(%rbx),%ecx
    161c:	48 63 c9             	movslq %ecx,%rcx
    161f:	44 89 04 8e          	mov    %r8d,(%rsi,%rcx,4)
    1623:	41 8d 4c 24 01       	lea    0x1(%r12),%ecx
    1628:	48 63 f1             	movslq %ecx,%rsi
    162b:	48 63 c8             	movslq %eax,%rcx
    162e:	48 0f af ce          	imul   %rsi,%rcx
    1632:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1639:	00 
    163a:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    163e:	48 01 ce             	add    %rcx,%rsi
    1641:	8d 4b 04             	lea    0x4(%rbx),%ecx
    1644:	48 63 c9             	movslq %ecx,%rcx
    1647:	44 89 14 8e          	mov    %r10d,(%rsi,%rcx,4)
    164b:	41 8d 4c 24 02       	lea    0x2(%r12),%ecx
    1650:	48 63 f1             	movslq %ecx,%rsi
    1653:	48 63 c8             	movslq %eax,%rcx
    1656:	48 0f af ce          	imul   %rsi,%rcx
    165a:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1661:	00 
    1662:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1666:	48 01 ce             	add    %rcx,%rsi
    1669:	8d 4b 04             	lea    0x4(%rbx),%ecx
    166c:	48 63 c9             	movslq %ecx,%rcx
    166f:	44 89 2c 8e          	mov    %r13d,(%rsi,%rcx,4)
    1673:	41 8d 4c 24 03       	lea    0x3(%r12),%ecx
    1678:	48 63 f1             	movslq %ecx,%rsi
    167b:	48 63 c8             	movslq %eax,%rcx
    167e:	48 0f af ce          	imul   %rsi,%rcx
    1682:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1689:	00 
    168a:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    168e:	48 01 ce             	add    %rcx,%rsi
    1691:	8d 4b 04             	lea    0x4(%rbx),%ecx
    1694:	48 63 c9             	movslq %ecx,%rcx
    1697:	8b 7d a4             	mov    -0x5c(%rbp),%edi
    169a:	89 3c 8e             	mov    %edi,(%rsi,%rcx,4)
    169d:	83 c3 01             	add    $0x1,%ebx
    16a0:	41 8d 4e 03          	lea    0x3(%r14),%ecx
    16a4:	39 cb                	cmp    %ecx,%ebx
    16a6:	0f 8e a2 fd ff ff    	jle    144e <transpose_submit+0x325>
    16ac:	45 89 e5             	mov    %r12d,%r13d
    16af:	e9 50 02 00 00       	jmp    1904 <transpose_submit+0x7db>
    16b4:	41 8d 4e 04          	lea    0x4(%r14),%ecx
    16b8:	48 63 f1             	movslq %ecx,%rsi
    16bb:	48 63 ca             	movslq %edx,%rcx
    16be:	48 0f af ce          	imul   %rsi,%rcx
    16c2:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    16c9:	00 
    16ca:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    16ce:	48 01 ce             	add    %rcx,%rsi
    16d1:	49 63 cd             	movslq %r13d,%rcx
    16d4:	8b 3c 8e             	mov    (%rsi,%rcx,4),%edi
    16d7:	41 8d 4e 05          	lea    0x5(%r14),%ecx
    16db:	48 63 f1             	movslq %ecx,%rsi
    16de:	48 63 ca             	movslq %edx,%rcx
    16e1:	48 0f af ce          	imul   %rsi,%rcx
    16e5:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    16ec:	00 
    16ed:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    16f1:	48 01 ce             	add    %rcx,%rsi
    16f4:	49 63 cd             	movslq %r13d,%rcx
    16f7:	8b 1c 8e             	mov    (%rsi,%rcx,4),%ebx
    16fa:	41 8d 4e 06          	lea    0x6(%r14),%ecx
    16fe:	48 63 f1             	movslq %ecx,%rsi
    1701:	48 63 ca             	movslq %edx,%rcx
    1704:	48 0f af ce          	imul   %rsi,%rcx
    1708:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    170f:	00 
    1710:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1714:	48 01 ce             	add    %rcx,%rsi
    1717:	49 63 cd             	movslq %r13d,%rcx
    171a:	44 8b 0c 8e          	mov    (%rsi,%rcx,4),%r9d
    171e:	41 8d 4e 07          	lea    0x7(%r14),%ecx
    1722:	48 63 f1             	movslq %ecx,%rsi
    1725:	48 63 ca             	movslq %edx,%rcx
    1728:	48 0f af ce          	imul   %rsi,%rcx
    172c:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1733:	00 
    1734:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1738:	48 01 ce             	add    %rcx,%rsi
    173b:	49 63 cd             	movslq %r13d,%rcx
    173e:	44 8b 3c 8e          	mov    (%rsi,%rcx,4),%r15d
    1742:	49 63 f5             	movslq %r13d,%rsi
    1745:	48 63 c8             	movslq %eax,%rcx
    1748:	48 0f af ce          	imul   %rsi,%rcx
    174c:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1753:	00 
    1754:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1758:	48 01 ce             	add    %rcx,%rsi
    175b:	41 8d 4e 04          	lea    0x4(%r14),%ecx
    175f:	48 63 c9             	movslq %ecx,%rcx
    1762:	44 8b 1c 8e          	mov    (%rsi,%rcx,4),%r11d
    1766:	49 63 f5             	movslq %r13d,%rsi
    1769:	48 63 c8             	movslq %eax,%rcx
    176c:	48 0f af ce          	imul   %rsi,%rcx
    1770:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1777:	00 
    1778:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    177c:	48 01 ce             	add    %rcx,%rsi
    177f:	41 8d 4e 05          	lea    0x5(%r14),%ecx
    1783:	48 63 c9             	movslq %ecx,%rcx
    1786:	44 8b 04 8e          	mov    (%rsi,%rcx,4),%r8d
    178a:	49 63 f5             	movslq %r13d,%rsi
    178d:	48 63 c8             	movslq %eax,%rcx
    1790:	48 0f af ce          	imul   %rsi,%rcx
    1794:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    179b:	00 
    179c:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    17a0:	48 01 ce             	add    %rcx,%rsi
    17a3:	41 8d 4e 06          	lea    0x6(%r14),%ecx
    17a7:	48 63 c9             	movslq %ecx,%rcx
    17aa:	44 8b 14 8e          	mov    (%rsi,%rcx,4),%r10d
    17ae:	49 63 f5             	movslq %r13d,%rsi
    17b1:	48 63 c8             	movslq %eax,%rcx
    17b4:	48 0f af ce          	imul   %rsi,%rcx
    17b8:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    17bf:	00 
    17c0:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    17c4:	48 01 ce             	add    %rcx,%rsi
    17c7:	41 8d 4e 07          	lea    0x7(%r14),%ecx
    17cb:	48 63 c9             	movslq %ecx,%rcx
    17ce:	8b 34 8e             	mov    (%rsi,%rcx,4),%esi
    17d1:	89 75 a4             	mov    %esi,-0x5c(%rbp)
    17d4:	49 63 f5             	movslq %r13d,%rsi
    17d7:	48 63 c8             	movslq %eax,%rcx
    17da:	48 0f af ce          	imul   %rsi,%rcx
    17de:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    17e5:	00 
    17e6:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    17ea:	48 01 ce             	add    %rcx,%rsi
    17ed:	41 8d 4e 04          	lea    0x4(%r14),%ecx
    17f1:	48 63 c9             	movslq %ecx,%rcx
    17f4:	89 3c 8e             	mov    %edi,(%rsi,%rcx,4)
    17f7:	49 63 f5             	movslq %r13d,%rsi
    17fa:	48 63 c8             	movslq %eax,%rcx
    17fd:	48 0f af ce          	imul   %rsi,%rcx
    1801:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1808:	00 
    1809:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    180d:	48 01 ce             	add    %rcx,%rsi
    1810:	41 8d 4e 05          	lea    0x5(%r14),%ecx
    1814:	48 63 c9             	movslq %ecx,%rcx
    1817:	89 1c 8e             	mov    %ebx,(%rsi,%rcx,4)
    181a:	49 63 f5             	movslq %r13d,%rsi
    181d:	48 63 c8             	movslq %eax,%rcx
    1820:	48 0f af ce          	imul   %rsi,%rcx
    1824:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    182b:	00 
    182c:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1830:	48 01 ce             	add    %rcx,%rsi
    1833:	41 8d 4e 06          	lea    0x6(%r14),%ecx
    1837:	48 63 c9             	movslq %ecx,%rcx
    183a:	44 89 0c 8e          	mov    %r9d,(%rsi,%rcx,4)
    183e:	49 63 f5             	movslq %r13d,%rsi
    1841:	48 63 c8             	movslq %eax,%rcx
    1844:	48 0f af ce          	imul   %rsi,%rcx
    1848:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    184f:	00 
    1850:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1854:	48 01 ce             	add    %rcx,%rsi
    1857:	41 8d 4e 07          	lea    0x7(%r14),%ecx
    185b:	48 63 c9             	movslq %ecx,%rcx
    185e:	44 89 3c 8e          	mov    %r15d,(%rsi,%rcx,4)
    1862:	41 8d 4d 04          	lea    0x4(%r13),%ecx
    1866:	48 63 f1             	movslq %ecx,%rsi
    1869:	48 63 c8             	movslq %eax,%rcx
    186c:	48 0f af ce          	imul   %rsi,%rcx
    1870:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1877:	00 
    1878:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    187c:	48 01 ce             	add    %rcx,%rsi
    187f:	49 63 ce             	movslq %r14d,%rcx
    1882:	44 89 1c 8e          	mov    %r11d,(%rsi,%rcx,4)
    1886:	41 8d 4d 04          	lea    0x4(%r13),%ecx
    188a:	48 63 f1             	movslq %ecx,%rsi
    188d:	48 63 c8             	movslq %eax,%rcx
    1890:	48 0f af ce          	imul   %rsi,%rcx
    1894:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    189b:	00 
    189c:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    18a0:	48 01 ce             	add    %rcx,%rsi
    18a3:	41 8d 4e 01          	lea    0x1(%r14),%ecx
    18a7:	48 63 c9             	movslq %ecx,%rcx
    18aa:	44 89 04 8e          	mov    %r8d,(%rsi,%rcx,4)
    18ae:	41 8d 4d 04          	lea    0x4(%r13),%ecx
    18b2:	48 63 f1             	movslq %ecx,%rsi
    18b5:	48 63 c8             	movslq %eax,%rcx
    18b8:	48 0f af ce          	imul   %rsi,%rcx
    18bc:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    18c3:	00 
    18c4:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    18c8:	48 01 ce             	add    %rcx,%rsi
    18cb:	41 8d 4e 02          	lea    0x2(%r14),%ecx
    18cf:	48 63 c9             	movslq %ecx,%rcx
    18d2:	44 89 14 8e          	mov    %r10d,(%rsi,%rcx,4)
    18d6:	41 8d 4d 04          	lea    0x4(%r13),%ecx
    18da:	48 63 f1             	movslq %ecx,%rsi
    18dd:	48 63 c8             	movslq %eax,%rcx
    18e0:	48 0f af ce          	imul   %rsi,%rcx
    18e4:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    18eb:	00 
    18ec:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    18f0:	48 01 ce             	add    %rcx,%rsi
    18f3:	41 8d 4e 03          	lea    0x3(%r14),%ecx
    18f7:	48 63 c9             	movslq %ecx,%rcx
    18fa:	8b 7d a4             	mov    -0x5c(%rbp),%edi
    18fd:	89 3c 8e             	mov    %edi,(%rsi,%rcx,4)
    1900:	41 83 c5 01          	add    $0x1,%r13d
    1904:	41 8d 4c 24 03       	lea    0x3(%r12),%ecx
    1909:	41 39 cd             	cmp    %ecx,%r13d
    190c:	0f 8e a2 fd ff ff    	jle    16b4 <transpose_submit+0x58b>
    1912:	41 8d 5e 04          	lea    0x4(%r14),%ebx
    1916:	e9 29 01 00 00       	jmp    1a44 <transpose_submit+0x91b>
    191b:	48 63 f3             	movslq %ebx,%rsi
    191e:	48 63 ca             	movslq %edx,%rcx
    1921:	48 0f af ce          	imul   %rsi,%rcx
    1925:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    192c:	00 
    192d:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1931:	48 01 ce             	add    %rcx,%rsi
    1934:	41 8d 4c 24 04       	lea    0x4(%r12),%ecx
    1939:	48 63 c9             	movslq %ecx,%rcx
    193c:	8b 3c 8e             	mov    (%rsi,%rcx,4),%edi
    193f:	48 63 f3             	movslq %ebx,%rsi
    1942:	48 63 ca             	movslq %edx,%rcx
    1945:	48 0f af ce          	imul   %rsi,%rcx
    1949:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1950:	00 
    1951:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1955:	48 01 ce             	add    %rcx,%rsi
    1958:	41 8d 4c 24 05       	lea    0x5(%r12),%ecx
    195d:	48 63 c9             	movslq %ecx,%rcx
    1960:	44 8b 0c 8e          	mov    (%rsi,%rcx,4),%r9d
    1964:	48 63 f3             	movslq %ebx,%rsi
    1967:	48 63 ca             	movslq %edx,%rcx
    196a:	48 0f af ce          	imul   %rsi,%rcx
    196e:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1975:	00 
    1976:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    197a:	48 01 ce             	add    %rcx,%rsi
    197d:	41 8d 4c 24 06       	lea    0x6(%r12),%ecx
    1982:	48 63 c9             	movslq %ecx,%rcx
    1985:	44 8b 1c 8e          	mov    (%rsi,%rcx,4),%r11d
    1989:	48 63 f3             	movslq %ebx,%rsi
    198c:	48 63 ca             	movslq %edx,%rcx
    198f:	48 0f af ce          	imul   %rsi,%rcx
    1993:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    199a:	00 
    199b:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    199f:	48 01 ce             	add    %rcx,%rsi
    19a2:	41 8d 4c 24 07       	lea    0x7(%r12),%ecx
    19a7:	48 63 c9             	movslq %ecx,%rcx
    19aa:	44 8b 3c 8e          	mov    (%rsi,%rcx,4),%r15d
    19ae:	41 8d 4c 24 04       	lea    0x4(%r12),%ecx
    19b3:	48 63 f1             	movslq %ecx,%rsi
    19b6:	48 63 c8             	movslq %eax,%rcx
    19b9:	48 0f af ce          	imul   %rsi,%rcx
    19bd:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    19c4:	00 
    19c5:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    19c9:	48 01 ce             	add    %rcx,%rsi
    19cc:	48 63 cb             	movslq %ebx,%rcx
    19cf:	89 3c 8e             	mov    %edi,(%rsi,%rcx,4)
    19d2:	41 8d 4c 24 05       	lea    0x5(%r12),%ecx
    19d7:	48 63 f1             	movslq %ecx,%rsi
    19da:	48 63 c8             	movslq %eax,%rcx
    19dd:	48 0f af ce          	imul   %rsi,%rcx
    19e1:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    19e8:	00 
    19e9:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    19ed:	48 01 ce             	add    %rcx,%rsi
    19f0:	48 63 cb             	movslq %ebx,%rcx
    19f3:	44 89 0c 8e          	mov    %r9d,(%rsi,%rcx,4)
    19f7:	41 8d 4c 24 06       	lea    0x6(%r12),%ecx
    19fc:	48 63 f1             	movslq %ecx,%rsi
    19ff:	48 63 c8             	movslq %eax,%rcx
    1a02:	48 0f af ce          	imul   %rsi,%rcx
    1a06:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1a0d:	00 
    1a0e:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1a12:	48 01 ce             	add    %rcx,%rsi
    1a15:	48 63 cb             	movslq %ebx,%rcx
    1a18:	44 89 1c 8e          	mov    %r11d,(%rsi,%rcx,4)
    1a1c:	41 8d 4c 24 07       	lea    0x7(%r12),%ecx
    1a21:	48 63 f1             	movslq %ecx,%rsi
    1a24:	48 63 c8             	movslq %eax,%rcx
    1a27:	48 0f af ce          	imul   %rsi,%rcx
    1a2b:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1a32:	00 
    1a33:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1a37:	48 01 ce             	add    %rcx,%rsi
    1a3a:	48 63 cb             	movslq %ebx,%rcx
    1a3d:	44 89 3c 8e          	mov    %r15d,(%rsi,%rcx,4)
    1a41:	83 c3 01             	add    $0x1,%ebx
    1a44:	41 8d 4e 07          	lea    0x7(%r14),%ecx
    1a48:	39 cb                	cmp    %ecx,%ebx
    1a4a:	0f 8e cb fe ff ff    	jle    191b <transpose_submit+0x7f2>
    1a50:	41 83 c4 08          	add    $0x8,%r12d
    1a54:	44 3b 65 bc          	cmp    -0x44(%rbp),%r12d
    1a58:	0f 8c e8 f9 ff ff    	jl     1446 <transpose_submit+0x31d>
    1a5e:	41 83 c6 08          	add    $0x8,%r14d
    1a62:	44 3b 75 b8          	cmp    -0x48(%rbp),%r14d
    1a66:	0f 8c cf f9 ff ff    	jl     143b <transpose_submit+0x312>
    1a6c:	e9 99 00 00 00       	jmp    1b0a <transpose_submit+0x9e1>
    1a71:	41 be 00 00 00 00    	mov    $0x0,%r14d
    1a77:	e9 82 00 00 00       	jmp    1afe <transpose_submit+0x9d5>
    1a7c:	41 bc 00 00 00 00    	mov    $0x0,%r12d
    1a82:	eb 70                	jmp    1af4 <transpose_submit+0x9cb>
    1a84:	44 89 f3             	mov    %r14d,%ebx
    1a87:	eb 5a                	jmp    1ae3 <transpose_submit+0x9ba>
    1a89:	45 89 e5             	mov    %r12d,%r13d
    1a8c:	eb 42                	jmp    1ad0 <transpose_submit+0x9a7>
    1a8e:	48 63 f3             	movslq %ebx,%rsi
    1a91:	48 63 ca             	movslq %edx,%rcx
    1a94:	48 0f af ce          	imul   %rsi,%rcx
    1a98:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1a9f:	00 
    1aa0:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
    1aa4:	48 01 ce             	add    %rcx,%rsi
    1aa7:	49 63 fd             	movslq %r13d,%rdi
    1aaa:	48 63 c8             	movslq %eax,%rcx
    1aad:	48 0f af cf          	imul   %rdi,%rcx
    1ab1:	48 8d 3c 8d 00 00 00 	lea    0x0(,%rcx,4),%rdi
    1ab8:	00 
    1ab9:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    1abd:	48 01 cf             	add    %rcx,%rdi
    1ac0:	49 63 cd             	movslq %r13d,%rcx
    1ac3:	8b 34 8e             	mov    (%rsi,%rcx,4),%esi
    1ac6:	48 63 cb             	movslq %ebx,%rcx
    1ac9:	89 34 8f             	mov    %esi,(%rdi,%rcx,4)
    1acc:	41 83 c5 01          	add    $0x1,%r13d
    1ad0:	44 3b 6d bc          	cmp    -0x44(%rbp),%r13d
    1ad4:	7d 0a                	jge    1ae0 <transpose_submit+0x9b7>
    1ad6:	41 8d 4c 24 0f       	lea    0xf(%r12),%ecx
    1adb:	41 39 cd             	cmp    %ecx,%r13d
    1ade:	7e ae                	jle    1a8e <transpose_submit+0x965>
    1ae0:	83 c3 01             	add    $0x1,%ebx
    1ae3:	3b 5d b8             	cmp    -0x48(%rbp),%ebx
    1ae6:	7d 08                	jge    1af0 <transpose_submit+0x9c7>
    1ae8:	41 8d 4e 0f          	lea    0xf(%r14),%ecx
    1aec:	39 cb                	cmp    %ecx,%ebx
    1aee:	7e 99                	jle    1a89 <transpose_submit+0x960>
    1af0:	41 83 c4 10          	add    $0x10,%r12d
    1af4:	44 3b 65 bc          	cmp    -0x44(%rbp),%r12d
    1af8:	7c 8a                	jl     1a84 <transpose_submit+0x95b>
    1afa:	41 83 c6 10          	add    $0x10,%r14d
    1afe:	44 3b 75 b8          	cmp    -0x48(%rbp),%r14d
    1b02:	0f 8c 74 ff ff ff    	jl     1a7c <transpose_submit+0x953>
    1b08:	eb 00                	jmp    1b0a <transpose_submit+0x9e1>
    1b0a:	90                   	nop
    1b0b:	5b                   	pop    %rbx
    1b0c:	41 5c                	pop    %r12
    1b0e:	41 5d                	pop    %r13
    1b10:	41 5e                	pop    %r14
    1b12:	41 5f                	pop    %r15
    1b14:	5d                   	pop    %rbp
    1b15:	c3                   	ret    

0000000000001b16 <trans_32_32>:
    1b16:	f3 0f 1e fa          	endbr64 
    1b1a:	55                   	push   %rbp
    1b1b:	48 89 e5             	mov    %rsp,%rbp
    1b1e:	41 57                	push   %r15
    1b20:	41 56                	push   %r14
    1b22:	41 55                	push   %r13
    1b24:	41 54                	push   %r12
    1b26:	53                   	push   %rbx
    1b27:	89 7d ac             	mov    %edi,-0x54(%rbp)
    1b2a:	89 75 a8             	mov    %esi,-0x58(%rbp)
    1b2d:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
    1b31:	48 89 4d 98          	mov    %rcx,-0x68(%rbp)
    1b35:	8b 45 ac             	mov    -0x54(%rbp),%eax
    1b38:	48 63 d0             	movslq %eax,%rdx
    1b3b:	48 83 ea 01          	sub    $0x1,%rdx
    1b3f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
    1b43:	48 63 d0             	movslq %eax,%rdx
    1b46:	49 89 d2             	mov    %rdx,%r10
    1b49:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    1b4f:	8b 55 a8             	mov    -0x58(%rbp),%edx
    1b52:	48 63 ca             	movslq %edx,%rcx
    1b55:	48 83 e9 01          	sub    $0x1,%rcx
    1b59:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    1b5d:	48 63 ca             	movslq %edx,%rcx
    1b60:	49 89 c8             	mov    %rcx,%r8
    1b63:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    1b69:	41 bc 00 00 00 00    	mov    $0x0,%r12d
    1b6f:	e9 f9 02 00 00       	jmp    1e6d <trans_32_32+0x357>
    1b74:	bb 00 00 00 00       	mov    $0x0,%ebx
    1b79:	e9 e2 02 00 00       	jmp    1e60 <trans_32_32+0x34a>
    1b7e:	41 39 dc             	cmp    %ebx,%r12d
    1b81:	74 67                	je     1bea <trans_32_32+0xd4>
    1b83:	45 89 e5             	mov    %r12d,%r13d
    1b86:	eb 53                	jmp    1bdb <trans_32_32+0xc5>
    1b88:	41 89 de             	mov    %ebx,%r14d
    1b8b:	eb 42                	jmp    1bcf <trans_32_32+0xb9>
    1b8d:	49 63 f5             	movslq %r13d,%rsi
    1b90:	48 63 c8             	movslq %eax,%rcx
    1b93:	48 0f af ce          	imul   %rsi,%rcx
    1b97:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1b9e:	00 
    1b9f:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1ba3:	48 01 ce             	add    %rcx,%rsi
    1ba6:	49 63 fe             	movslq %r14d,%rdi
    1ba9:	48 63 ca             	movslq %edx,%rcx
    1bac:	48 0f af cf          	imul   %rdi,%rcx
    1bb0:	48 8d 3c 8d 00 00 00 	lea    0x0(,%rcx,4),%rdi
    1bb7:	00 
    1bb8:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    1bbc:	48 01 cf             	add    %rcx,%rdi
    1bbf:	49 63 ce             	movslq %r14d,%rcx
    1bc2:	8b 34 8e             	mov    (%rsi,%rcx,4),%esi
    1bc5:	49 63 cd             	movslq %r13d,%rcx
    1bc8:	89 34 8f             	mov    %esi,(%rdi,%rcx,4)
    1bcb:	41 83 c6 01          	add    $0x1,%r14d
    1bcf:	8d 4b 07             	lea    0x7(%rbx),%ecx
    1bd2:	41 39 ce             	cmp    %ecx,%r14d
    1bd5:	7e b6                	jle    1b8d <trans_32_32+0x77>
    1bd7:	41 83 c5 01          	add    $0x1,%r13d
    1bdb:	41 8d 4c 24 07       	lea    0x7(%r12),%ecx
    1be0:	41 39 cd             	cmp    %ecx,%r13d
    1be3:	7e a3                	jle    1b88 <trans_32_32+0x72>
    1be5:	e9 73 02 00 00       	jmp    1e5d <trans_32_32+0x347>
    1bea:	44 89 65 bc          	mov    %r12d,-0x44(%rbp)
    1bee:	e9 5c 02 00 00       	jmp    1e4f <trans_32_32+0x339>
    1bf3:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1bf6:	48 63 f1             	movslq %ecx,%rsi
    1bf9:	48 63 c8             	movslq %eax,%rcx
    1bfc:	48 0f af ce          	imul   %rsi,%rcx
    1c00:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1c07:	00 
    1c08:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1c0c:	48 01 ce             	add    %rcx,%rsi
    1c0f:	48 63 cb             	movslq %ebx,%rcx
    1c12:	8b 3c 8e             	mov    (%rsi,%rcx,4),%edi
    1c15:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1c18:	48 63 f1             	movslq %ecx,%rsi
    1c1b:	48 63 c8             	movslq %eax,%rcx
    1c1e:	48 0f af ce          	imul   %rsi,%rcx
    1c22:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1c29:	00 
    1c2a:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1c2e:	48 01 ce             	add    %rcx,%rsi
    1c31:	8d 4b 01             	lea    0x1(%rbx),%ecx
    1c34:	48 63 c9             	movslq %ecx,%rcx
    1c37:	44 8b 0c 8e          	mov    (%rsi,%rcx,4),%r9d
    1c3b:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1c3e:	48 63 f1             	movslq %ecx,%rsi
    1c41:	48 63 c8             	movslq %eax,%rcx
    1c44:	48 0f af ce          	imul   %rsi,%rcx
    1c48:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1c4f:	00 
    1c50:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1c54:	48 01 ce             	add    %rcx,%rsi
    1c57:	8d 4b 02             	lea    0x2(%rbx),%ecx
    1c5a:	48 63 c9             	movslq %ecx,%rcx
    1c5d:	44 8b 1c 8e          	mov    (%rsi,%rcx,4),%r11d
    1c61:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1c64:	48 63 f1             	movslq %ecx,%rsi
    1c67:	48 63 c8             	movslq %eax,%rcx
    1c6a:	48 0f af ce          	imul   %rsi,%rcx
    1c6e:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1c75:	00 
    1c76:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1c7a:	48 01 ce             	add    %rcx,%rsi
    1c7d:	8d 4b 03             	lea    0x3(%rbx),%ecx
    1c80:	48 63 c9             	movslq %ecx,%rcx
    1c83:	44 8b 04 8e          	mov    (%rsi,%rcx,4),%r8d
    1c87:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1c8a:	48 63 f1             	movslq %ecx,%rsi
    1c8d:	48 63 c8             	movslq %eax,%rcx
    1c90:	48 0f af ce          	imul   %rsi,%rcx
    1c94:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1c9b:	00 
    1c9c:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1ca0:	48 01 ce             	add    %rcx,%rsi
    1ca3:	8d 4b 04             	lea    0x4(%rbx),%ecx
    1ca6:	48 63 c9             	movslq %ecx,%rcx
    1ca9:	44 8b 14 8e          	mov    (%rsi,%rcx,4),%r10d
    1cad:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1cb0:	48 63 f1             	movslq %ecx,%rsi
    1cb3:	48 63 c8             	movslq %eax,%rcx
    1cb6:	48 0f af ce          	imul   %rsi,%rcx
    1cba:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1cc1:	00 
    1cc2:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1cc6:	48 01 ce             	add    %rcx,%rsi
    1cc9:	8d 4b 05             	lea    0x5(%rbx),%ecx
    1ccc:	48 63 c9             	movslq %ecx,%rcx
    1ccf:	44 8b 3c 8e          	mov    (%rsi,%rcx,4),%r15d
    1cd3:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1cd6:	48 63 f1             	movslq %ecx,%rsi
    1cd9:	48 63 c8             	movslq %eax,%rcx
    1cdc:	48 0f af ce          	imul   %rsi,%rcx
    1ce0:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1ce7:	00 
    1ce8:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1cec:	48 01 ce             	add    %rcx,%rsi
    1cef:	8d 4b 06             	lea    0x6(%rbx),%ecx
    1cf2:	48 63 c9             	movslq %ecx,%rcx
    1cf5:	44 8b 34 8e          	mov    (%rsi,%rcx,4),%r14d
    1cf9:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1cfc:	48 63 f1             	movslq %ecx,%rsi
    1cff:	48 63 c8             	movslq %eax,%rcx
    1d02:	48 0f af ce          	imul   %rsi,%rcx
    1d06:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1d0d:	00 
    1d0e:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    1d12:	48 01 ce             	add    %rcx,%rsi
    1d15:	8d 4b 07             	lea    0x7(%rbx),%ecx
    1d18:	48 63 c9             	movslq %ecx,%rcx
    1d1b:	44 8b 2c 8e          	mov    (%rsi,%rcx,4),%r13d
    1d1f:	48 63 f3             	movslq %ebx,%rsi
    1d22:	48 63 ca             	movslq %edx,%rcx
    1d25:	48 0f af ce          	imul   %rsi,%rcx
    1d29:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1d30:	00 
    1d31:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    1d35:	48 01 ce             	add    %rcx,%rsi
    1d38:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1d3b:	48 63 c9             	movslq %ecx,%rcx
    1d3e:	89 3c 8e             	mov    %edi,(%rsi,%rcx,4)
    1d41:	8d 4b 01             	lea    0x1(%rbx),%ecx
    1d44:	48 63 f1             	movslq %ecx,%rsi
    1d47:	48 63 ca             	movslq %edx,%rcx
    1d4a:	48 0f af ce          	imul   %rsi,%rcx
    1d4e:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1d55:	00 
    1d56:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    1d5a:	48 01 ce             	add    %rcx,%rsi
    1d5d:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1d60:	48 63 c9             	movslq %ecx,%rcx
    1d63:	44 89 0c 8e          	mov    %r9d,(%rsi,%rcx,4)
    1d67:	8d 4b 02             	lea    0x2(%rbx),%ecx
    1d6a:	48 63 f1             	movslq %ecx,%rsi
    1d6d:	48 63 ca             	movslq %edx,%rcx
    1d70:	48 0f af ce          	imul   %rsi,%rcx
    1d74:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1d7b:	00 
    1d7c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    1d80:	48 01 ce             	add    %rcx,%rsi
    1d83:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1d86:	48 63 c9             	movslq %ecx,%rcx
    1d89:	44 89 1c 8e          	mov    %r11d,(%rsi,%rcx,4)
    1d8d:	8d 4b 03             	lea    0x3(%rbx),%ecx
    1d90:	48 63 f1             	movslq %ecx,%rsi
    1d93:	48 63 ca             	movslq %edx,%rcx
    1d96:	48 0f af ce          	imul   %rsi,%rcx
    1d9a:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1da1:	00 
    1da2:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    1da6:	48 01 ce             	add    %rcx,%rsi
    1da9:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1dac:	48 63 c9             	movslq %ecx,%rcx
    1daf:	44 89 04 8e          	mov    %r8d,(%rsi,%rcx,4)
    1db3:	8d 4b 04             	lea    0x4(%rbx),%ecx
    1db6:	48 63 f1             	movslq %ecx,%rsi
    1db9:	48 63 ca             	movslq %edx,%rcx
    1dbc:	48 0f af ce          	imul   %rsi,%rcx
    1dc0:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1dc7:	00 
    1dc8:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    1dcc:	48 01 ce             	add    %rcx,%rsi
    1dcf:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1dd2:	48 63 c9             	movslq %ecx,%rcx
    1dd5:	44 89 14 8e          	mov    %r10d,(%rsi,%rcx,4)
    1dd9:	8d 4b 05             	lea    0x5(%rbx),%ecx
    1ddc:	48 63 f1             	movslq %ecx,%rsi
    1ddf:	48 63 ca             	movslq %edx,%rcx
    1de2:	48 0f af ce          	imul   %rsi,%rcx
    1de6:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1ded:	00 
    1dee:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    1df2:	48 01 ce             	add    %rcx,%rsi
    1df5:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1df8:	48 63 c9             	movslq %ecx,%rcx
    1dfb:	44 89 3c 8e          	mov    %r15d,(%rsi,%rcx,4)
    1dff:	8d 4b 06             	lea    0x6(%rbx),%ecx
    1e02:	48 63 f1             	movslq %ecx,%rsi
    1e05:	48 63 ca             	movslq %edx,%rcx
    1e08:	48 0f af ce          	imul   %rsi,%rcx
    1e0c:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1e13:	00 
    1e14:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    1e18:	48 01 ce             	add    %rcx,%rsi
    1e1b:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1e1e:	48 63 c9             	movslq %ecx,%rcx
    1e21:	44 89 34 8e          	mov    %r14d,(%rsi,%rcx,4)
    1e25:	8d 4b 07             	lea    0x7(%rbx),%ecx
    1e28:	48 63 f1             	movslq %ecx,%rsi
    1e2b:	48 63 ca             	movslq %edx,%rcx
    1e2e:	48 0f af ce          	imul   %rsi,%rcx
    1e32:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1e39:	00 
    1e3a:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    1e3e:	48 01 ce             	add    %rcx,%rsi
    1e41:	8b 4d bc             	mov    -0x44(%rbp),%ecx
    1e44:	48 63 c9             	movslq %ecx,%rcx
    1e47:	44 89 2c 8e          	mov    %r13d,(%rsi,%rcx,4)
    1e4b:	83 45 bc 01          	addl   $0x1,-0x44(%rbp)
    1e4f:	41 8d 4c 24 07       	lea    0x7(%r12),%ecx
    1e54:	39 4d bc             	cmp    %ecx,-0x44(%rbp)
    1e57:	0f 8e 96 fd ff ff    	jle    1bf3 <trans_32_32+0xdd>
    1e5d:	83 c3 08             	add    $0x8,%ebx
    1e60:	3b 5d a8             	cmp    -0x58(%rbp),%ebx
    1e63:	0f 8c 15 fd ff ff    	jl     1b7e <trans_32_32+0x68>
    1e69:	41 83 c4 08          	add    $0x8,%r12d
    1e6d:	44 3b 65 ac          	cmp    -0x54(%rbp),%r12d
    1e71:	0f 8c fd fc ff ff    	jl     1b74 <trans_32_32+0x5e>
    1e77:	90                   	nop
    1e78:	90                   	nop
    1e79:	5b                   	pop    %rbx
    1e7a:	41 5c                	pop    %r12
    1e7c:	41 5d                	pop    %r13
    1e7e:	41 5e                	pop    %r14
    1e80:	41 5f                	pop    %r15
    1e82:	5d                   	pop    %rbp
    1e83:	c3                   	ret    

0000000000001e84 <registerFunctions>:
    1e84:	f3 0f 1e fa          	endbr64 
    1e88:	55                   	push   %rbp
    1e89:	48 89 e5             	mov    %rsp,%rbp
    1e8c:	90                   	nop
    1e8d:	5d                   	pop    %rbp
    1e8e:	c3                   	ret    

0000000000001e8f <is_transpose>:
    1e8f:	f3 0f 1e fa          	endbr64 
    1e93:	55                   	push   %rbp
    1e94:	48 89 e5             	mov    %rsp,%rbp
    1e97:	89 7d dc             	mov    %edi,-0x24(%rbp)
    1e9a:	89 75 d8             	mov    %esi,-0x28(%rbp)
    1e9d:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
    1ea1:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    1ea5:	8b 45 dc             	mov    -0x24(%rbp),%eax
    1ea8:	48 63 d0             	movslq %eax,%rdx
    1eab:	48 83 ea 01          	sub    $0x1,%rdx
    1eaf:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    1eb3:	48 63 d0             	movslq %eax,%rdx
    1eb6:	49 89 d2             	mov    %rdx,%r10
    1eb9:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    1ebf:	8b 55 d8             	mov    -0x28(%rbp),%edx
    1ec2:	48 63 ca             	movslq %edx,%rcx
    1ec5:	48 83 e9 01          	sub    $0x1,%rcx
    1ec9:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
    1ecd:	48 63 ca             	movslq %edx,%rcx
    1ed0:	49 89 c8             	mov    %rcx,%r8
    1ed3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    1ed9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    1ee0:	eb 6e                	jmp    1f50 <is_transpose+0xc1>
    1ee2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    1ee9:	eb 59                	jmp    1f44 <is_transpose+0xb5>
    1eeb:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1eee:	48 63 f1             	movslq %ecx,%rsi
    1ef1:	48 63 c8             	movslq %eax,%rcx
    1ef4:	48 0f af ce          	imul   %rsi,%rcx
    1ef8:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1eff:	00 
    1f00:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    1f04:	48 01 ce             	add    %rcx,%rsi
    1f07:	8b 4d ec             	mov    -0x14(%rbp),%ecx
    1f0a:	48 63 c9             	movslq %ecx,%rcx
    1f0d:	8b 34 8e             	mov    (%rsi,%rcx,4),%esi
    1f10:	8b 4d ec             	mov    -0x14(%rbp),%ecx
    1f13:	48 63 f9             	movslq %ecx,%rdi
    1f16:	48 63 ca             	movslq %edx,%rcx
    1f19:	48 0f af cf          	imul   %rdi,%rcx
    1f1d:	48 8d 3c 8d 00 00 00 	lea    0x0(,%rcx,4),%rdi
    1f24:	00 
    1f25:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    1f29:	48 01 cf             	add    %rcx,%rdi
    1f2c:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1f2f:	48 63 c9             	movslq %ecx,%rcx
    1f32:	8b 0c 8f             	mov    (%rdi,%rcx,4),%ecx
    1f35:	39 ce                	cmp    %ecx,%esi
    1f37:	74 07                	je     1f40 <is_transpose+0xb1>
    1f39:	b8 00 00 00 00       	mov    $0x0,%eax
    1f3e:	eb 1d                	jmp    1f5d <is_transpose+0xce>
    1f40:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    1f44:	8b 4d ec             	mov    -0x14(%rbp),%ecx
    1f47:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1f4a:	7c 9f                	jl     1eeb <is_transpose+0x5c>
    1f4c:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
    1f50:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1f53:	3b 4d d8             	cmp    -0x28(%rbp),%ecx
    1f56:	7c 8a                	jl     1ee2 <is_transpose+0x53>
    1f58:	b8 01 00 00 00       	mov    $0x1,%eax
    1f5d:	5d                   	pop    %rbp
    1f5e:	c3                   	ret    

0000000000001f5f <main>:
    1f5f:	f3 0f 1e fa          	endbr64 
    1f63:	55                   	push   %rbp
    1f64:	48 89 e5             	mov    %rsp,%rbp
    1f67:	b8 00 00 00 00       	mov    $0x0,%eax
    1f6c:	5d                   	pop    %rbp
    1f6d:	c3                   	ret    

Disassembly of section .fini:

0000000000001f70 <_fini>:
    1f70:	f3 0f 1e fa          	endbr64 
    1f74:	48 83 ec 08          	sub    $0x8,%rsp
    1f78:	48 83 c4 08          	add    $0x8,%rsp
    1f7c:	c3                   	ret    
