%include "win32n.inc" 					;include file

extern puts 
import puts msvcrt.dll
extern printf							;khai bao cac ham dung trong chuong trinh
import printf msvcrt.dll
extern scanf
import scanf msvcrt.dll
extern exit
import exit msvcrt.dll

segment .data use32							;section data

in_message db "enter a number:",0	;nhap vao 1 so he 10
out_message1 db "binary is:",0			;in ra he 2
out_message2 db "octan is:",0			;in ra he 8
out_message3 db "hexa is:",0			;in ra he 16
buf db "0123456789ABCDEF",0							;day tu 0-F de lay bit
result_2 db "00000000000000000000000000000000",0	;xau de luu ma binary, khoi tao 0x00h :32 so 0
result_8 db "000000000000",0						;xau de luu ma octan,khoi tao 12 so 0
result_16 db "00000000",0							;xau de luu ma hexa,khoi tao 8 so 0
N dd 0												;N-interger 32bit de luu gia tri nhap vao tu keyboard
format_in db "%d",0									;format_in la xau dinh danh

segment .code use32

..start:
push dword in_message
call[printf]			;in ra man hinh :enter a number
add esp,4				;xoa bo cac tham so ra khoi stack
push N					
push dword format_in
call[scanf]				;goi ham scanf
add esp,8
mov eax,[N]					;EAX=N
mov ebx,2					;ebx=2
mov cx,32					;lap 32 lan
mov esi,0					;bien dem
lap1:
xor edi,edi
xor edx,edx					;edx=0
div ebx						;eax/ebx thuong luu o eax,du luu o edx
mov dl,[buf+edx]			;dl=buf[edx]
mov edi,result_2
add edi,31
sub edi,esi
mov [edi],dl	;dichuyen byte o dl vao result_2 theo thu tu duoi len
inc esi

loop lap1
lap2:
mov eax,[N]					;EAX=N				;;khoi tao lai cac thanh ghi de thucc hien voi he 8
mov ebx,8					;ebx=8,so chia
mov cx,12					;lap 12 lan
mov esi,0					;bien dem
jmp lap22
lap22:
xor edi,edi
xor edx,edx
div ebx
mov dl,[buf+edx]
mov edi,result_8
add edi,11
sub edi,esi
mov [edi],dl
inc esi
loop lap22
lap3:
mov eax,[N]					;EAX=N
mov ebx,16					;ebx=16 ,so bi chia la 16
mov cx,8					;lap 8 lan
mov esi,0					;bien dem
lap33:
xor edi,edi
xor edx,edx
div ebx
mov dl,[buf+edx]
mov edi,result_16
add edi,7
sub edi,esi
mov [edi],dl
inc esi
loop lap33
in_2:				;in xau nhi phan
push out_message1
call[puts]
add esp,4
push result_2
call[puts]
add esp,4
in_8:
push out_message2
call[puts]
add esp,4
push result_8
call[puts]
add esp,4
in_16:
push out_message3
call[puts]
add esp,4
push result_16
call[puts]
add esp,4
jmp ..start