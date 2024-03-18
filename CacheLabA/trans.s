	.file	"trans.c"
	.text
	.globl	transpose_submit
	.type	transpose_submit, @function
transpose_submit:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -68(%rbp)
	movl	%esi, -72(%rbp)
	movq	%rdx, -80(%rbp)
	movq	%rcx, -88(%rbp)
	movl	-68(%rbp), %edx
	movslq	%edx, %rax
	subq	$1, %rax
	movq	%rax, -64(%rbp)
	movslq	%edx, %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movl	-72(%rbp), %eax
	movslq	%eax, %rcx
	subq	$1, %rcx
	movq	%rcx, -56(%rbp)
	movslq	%eax, %rcx
	movq	%rcx, %r8
	movl	$0, %r9d
	cmpl	$32, -68(%rbp)
	jne	.L2
	cmpl	$32, -72(%rbp)
	jne	.L2
	movl	$0, %r14d
	jmp	.L3
.L8:
	movl	$0, %r12d
	jmp	.L4
.L7:
	movl	%r14d, %ebx
	jmp	.L5
.L6:
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%r12d, %rcx
	movl	(%rsi,%rcx,4), %edi
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	1(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r9d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	2(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r11d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	3(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r15d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r8d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	5(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r10d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	6(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r13d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	7(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %esi
	movl	%esi, -92(%rbp)
	movslq	%r12d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%edi, (%rsi,%rcx,4)
	leal	1(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r9d, (%rsi,%rcx,4)
	leal	2(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r11d, (%rsi,%rcx,4)
	leal	3(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r15d, (%rsi,%rcx,4)
	leal	4(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r8d, (%rsi,%rcx,4)
	leal	5(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r10d, (%rsi,%rcx,4)
	leal	6(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r13d, (%rsi,%rcx,4)
	leal	7(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	-92(%rbp), %edi
	movl	%edi, (%rsi,%rcx,4)
	addl	$1, %ebx
.L5:
	leal	7(%r14), %ecx
	cmpl	%ecx, %ebx
	jle	.L6
	addl	$8, %r12d
.L4:
	cmpl	-72(%rbp), %r12d
	jl	.L7
	addl	$8, %r14d
.L3:
	cmpl	-68(%rbp), %r14d
	jl	.L8
	jmp	.L31
.L2:
	cmpl	$64, -72(%rbp)
	jne	.L10
	movl	$0, %r14d
	jmp	.L11
.L20:
	movl	$0, %r12d
	jmp	.L12
.L19:
	movl	%r14d, %ebx
	jmp	.L13
.L14:
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%r12d, %rcx
	movl	(%rsi,%rcx,4), %edi
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	1(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r9d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	2(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r11d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	3(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r15d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r8d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	5(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r10d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	6(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r13d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	7(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %esi
	movl	%esi, -92(%rbp)
	movslq	%r12d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%edi, (%rsi,%rcx,4)
	leal	1(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r9d, (%rsi,%rcx,4)
	leal	2(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r11d, (%rsi,%rcx,4)
	leal	3(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r15d, (%rsi,%rcx,4)
	movslq	%r12d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	%r8d, (%rsi,%rcx,4)
	leal	1(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	%r10d, (%rsi,%rcx,4)
	leal	2(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	%r13d, (%rsi,%rcx,4)
	leal	3(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	-92(%rbp), %edi
	movl	%edi, (%rsi,%rcx,4)
	addl	$1, %ebx
.L13:
	leal	3(%r14), %ecx
	cmpl	%ecx, %ebx
	jle	.L14
	movl	%r12d, %r13d
	jmp	.L15
.L16:
	leal	4(%r14), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%r13d, %rcx
	movl	(%rsi,%rcx,4), %edi
	leal	5(%r14), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%r13d, %rcx
	movl	(%rsi,%rcx,4), %ebx
	leal	6(%r14), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%r13d, %rcx
	movl	(%rsi,%rcx,4), %r9d
	leal	7(%r14), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%r13d, %rcx
	movl	(%rsi,%rcx,4), %r15d
	movslq	%r13d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%r14), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r11d
	movslq	%r13d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	5(%r14), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r8d
	movslq	%r13d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	6(%r14), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r10d
	movslq	%r13d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	7(%r14), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %esi
	movl	%esi, -92(%rbp)
	movslq	%r13d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%r14), %ecx
	movslq	%ecx, %rcx
	movl	%edi, (%rsi,%rcx,4)
	movslq	%r13d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	5(%r14), %ecx
	movslq	%ecx, %rcx
	movl	%ebx, (%rsi,%rcx,4)
	movslq	%r13d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	6(%r14), %ecx
	movslq	%ecx, %rcx
	movl	%r9d, (%rsi,%rcx,4)
	movslq	%r13d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	7(%r14), %ecx
	movslq	%ecx, %rcx
	movl	%r15d, (%rsi,%rcx,4)
	leal	4(%r13), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%r14d, %rcx
	movl	%r11d, (%rsi,%rcx,4)
	leal	4(%r13), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	1(%r14), %ecx
	movslq	%ecx, %rcx
	movl	%r8d, (%rsi,%rcx,4)
	leal	4(%r13), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	2(%r14), %ecx
	movslq	%ecx, %rcx
	movl	%r10d, (%rsi,%rcx,4)
	leal	4(%r13), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	leal	3(%r14), %ecx
	movslq	%ecx, %rcx
	movl	-92(%rbp), %edi
	movl	%edi, (%rsi,%rcx,4)
	addl	$1, %r13d
.L15:
	leal	3(%r12), %ecx
	cmpl	%ecx, %r13d
	jle	.L16
	leal	4(%r14), %ebx
	jmp	.L17
.L18:
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %edi
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	5(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r9d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	6(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r11d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	leal	7(%r12), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r15d
	leal	4(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%edi, (%rsi,%rcx,4)
	leal	5(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r9d, (%rsi,%rcx,4)
	leal	6(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r11d, (%rsi,%rcx,4)
	leal	7(%r12), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	%r15d, (%rsi,%rcx,4)
	addl	$1, %ebx
.L17:
	leal	7(%r14), %ecx
	cmpl	%ecx, %ebx
	jle	.L18
	addl	$8, %r12d
.L12:
	cmpl	-68(%rbp), %r12d
	jl	.L19
	addl	$8, %r14d
.L11:
	cmpl	-72(%rbp), %r14d
	jl	.L20
	jmp	.L32
.L10:
	movl	$0, %r14d
	jmp	.L21
.L30:
	movl	$0, %r12d
	jmp	.L22
.L29:
	movl	%r14d, %ebx
	jmp	.L23
.L28:
	movl	%r12d, %r13d
	jmp	.L24
.L26:
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-80(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%r13d, %rdi
	movslq	%eax, %rcx
	imulq	%rdi, %rcx
	leaq	0(,%rcx,4), %rdi
	movq	-88(%rbp), %rcx
	addq	%rcx, %rdi
	movslq	%r13d, %rcx
	movl	(%rsi,%rcx,4), %esi
	movslq	%ebx, %rcx
	movl	%esi, (%rdi,%rcx,4)
	addl	$1, %r13d
.L24:
	cmpl	-68(%rbp), %r13d
	jge	.L25
	leal	15(%r12), %ecx
	cmpl	%ecx, %r13d
	jle	.L26
.L25:
	addl	$1, %ebx
.L23:
	cmpl	-72(%rbp), %ebx
	jge	.L27
	leal	15(%r14), %ecx
	cmpl	%ecx, %ebx
	jle	.L28
.L27:
	addl	$16, %r12d
.L22:
	cmpl	-68(%rbp), %r12d
	jl	.L29
	addl	$16, %r14d
.L21:
	cmpl	-72(%rbp), %r14d
	jl	.L30
	jmp	.L32
.L31:
.L32:
	nop
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	transpose_submit, .-transpose_submit
	.globl	trans_32_32
	.type	trans_32_32, @function
trans_32_32:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -84(%rbp)
	movl	%esi, -88(%rbp)
	movq	%rdx, -96(%rbp)
	movq	%rcx, -104(%rbp)
	movl	-84(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -64(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	movl	-88(%rbp), %edx
	movslq	%edx, %rcx
	subq	$1, %rcx
	movq	%rcx, -56(%rbp)
	movslq	%edx, %rcx
	movq	%rcx, %r8
	movl	$0, %r9d
	movl	$0, %r12d
	jmp	.L34
.L45:
	movl	$0, %ebx
	jmp	.L35
.L44:
	cmpl	%ebx, %r12d
	je	.L36
	movl	%r12d, %r13d
	jmp	.L37
.L40:
	movl	%ebx, %r14d
	jmp	.L38
.L39:
	movslq	%r13d, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-96(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%r14d, %rdi
	movslq	%edx, %rcx
	imulq	%rdi, %rcx
	leaq	0(,%rcx,4), %rdi
	movq	-104(%rbp), %rcx
	addq	%rcx, %rdi
	movslq	%r14d, %rcx
	movl	(%rsi,%rcx,4), %esi
	movslq	%r13d, %rcx
	movl	%esi, (%rdi,%rcx,4)
	addl	$1, %r14d
.L38:
	leal	7(%rbx), %ecx
	cmpl	%ecx, %r14d
	jle	.L39
	addl	$1, %r13d
.L37:
	leal	7(%r12), %ecx
	cmpl	%ecx, %r13d
	jle	.L40
	jmp	.L41
.L36:
	movl	%r12d, -68(%rbp)
	jmp	.L42
.L43:
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-96(%rbp), %rcx
	addq	%rcx, %rsi
	movslq	%ebx, %rcx
	movl	(%rsi,%rcx,4), %edi
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-96(%rbp), %rcx
	addq	%rcx, %rsi
	leal	1(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r9d
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-96(%rbp), %rcx
	addq	%rcx, %rsi
	leal	2(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r11d
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-96(%rbp), %rcx
	addq	%rcx, %rsi
	leal	3(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r8d
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-96(%rbp), %rcx
	addq	%rcx, %rsi
	leal	4(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r10d
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-96(%rbp), %rcx
	addq	%rcx, %rsi
	leal	5(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r15d
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-96(%rbp), %rcx
	addq	%rcx, %rsi
	leal	6(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r14d
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-96(%rbp), %rcx
	addq	%rcx, %rsi
	leal	7(%rbx), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %r13d
	movslq	%ebx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-104(%rbp), %rcx
	addq	%rcx, %rsi
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%edi, (%rsi,%rcx,4)
	leal	1(%rbx), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-104(%rbp), %rcx
	addq	%rcx, %rsi
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%r9d, (%rsi,%rcx,4)
	leal	2(%rbx), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-104(%rbp), %rcx
	addq	%rcx, %rsi
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%r11d, (%rsi,%rcx,4)
	leal	3(%rbx), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-104(%rbp), %rcx
	addq	%rcx, %rsi
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%r8d, (%rsi,%rcx,4)
	leal	4(%rbx), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-104(%rbp), %rcx
	addq	%rcx, %rsi
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%r10d, (%rsi,%rcx,4)
	leal	5(%rbx), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-104(%rbp), %rcx
	addq	%rcx, %rsi
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%r15d, (%rsi,%rcx,4)
	leal	6(%rbx), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-104(%rbp), %rcx
	addq	%rcx, %rsi
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%r14d, (%rsi,%rcx,4)
	leal	7(%rbx), %ecx
	movslq	%ecx, %rsi
	movslq	%edx, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-104(%rbp), %rcx
	addq	%rcx, %rsi
	movl	-68(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%r13d, (%rsi,%rcx,4)
	addl	$1, -68(%rbp)
.L42:
	leal	7(%r12), %ecx
	cmpl	%ecx, -68(%rbp)
	jle	.L43
.L41:
	addl	$8, %ebx
.L35:
	cmpl	-88(%rbp), %ebx
	jl	.L44
	addl	$8, %r12d
.L34:
	cmpl	-84(%rbp), %r12d
	jl	.L45
	nop
	nop
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	trans_32_32, .-trans_32_32
	.section	.rodata
.LC0:
	.string	"Transpose submission"
	.text
	.globl	registerFunctions
	.type	registerFunctions, @function
registerFunctions:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	transpose_submit(%rip), %rax
	movq	%rax, %rdi
	call	registerTransFunction@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	registerFunctions, .-registerFunctions
	.globl	is_transpose
	.type	is_transpose, @function
is_transpose:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movq	%rcx, -56(%rbp)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	movl	-40(%rbp), %edx
	movslq	%edx, %rcx
	subq	$1, %rcx
	movq	%rcx, -8(%rbp)
	movslq	%edx, %rcx
	movq	%rcx, %r8
	movl	$0, %r9d
	movl	$0, -24(%rbp)
	jmp	.L48
.L53:
	movl	$0, -20(%rbp)
	jmp	.L49
.L52:
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rsi
	movslq	%eax, %rcx
	imulq	%rsi, %rcx
	leaq	0(,%rcx,4), %rsi
	movq	-48(%rbp), %rcx
	addq	%rcx, %rsi
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx,4), %esi
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rdi
	movslq	%edx, %rcx
	imulq	%rdi, %rcx
	leaq	0(,%rcx,4), %rdi
	movq	-56(%rbp), %rcx
	addq	%rcx, %rdi
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	(%rdi,%rcx,4), %ecx
	cmpl	%ecx, %esi
	je	.L50
	movl	$0, %eax
	jmp	.L51
.L50:
	addl	$1, -20(%rbp)
.L49:
	movl	-20(%rbp), %ecx
	cmpl	-36(%rbp), %ecx
	jl	.L52
	addl	$1, -24(%rbp)
.L48:
	movl	-24(%rbp), %ecx
	cmpl	-40(%rbp), %ecx
	jl	.L53
	movl	$1, %eax
.L51:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	is_transpose, .-is_transpose
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
