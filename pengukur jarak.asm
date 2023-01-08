org 100h

jmp start      

hd:     db       "===============================================================",0dh,0ah,'$'
hd1     db       "|| PROGRAM MENGHITUNG JARAK, KECEPATAN, WAKTU DAN PERCEPATAN ||",0dh,0ah,'$'
hd2     db       "===============================================================", 0Dh,0Ah,'$'
msg:    db      "1. kecepatan",0dh,0ah,"2. Jarak ",0dh,0ah,"3. percepatan",0dh,0ah,"4. Percepatan",0dh,0ah,"   masukan pilihan", 0Dh,0Ah, '$'
msg2:    db      0dh,0ah,"masukan kecepatan (m/s)      : $"
msg3:    db      0dh,0ah,"masukan percepatan (m/s^2)   : $"
msg4:    db      0dh,0ah,"masukan waktu tempuh (s)     : $"
msg5:    db      0dh,0ah,"masukan jarak (m)            : $"
msg6:    db      0dh,0ah," Error $" 
msg7:    db      0dh,0ah,"Hasil : $" 
msg8:    db      0dh,0ah ,'Terimakasih !!!!  press any key... ', 0Dh,0Ah, '$'
                
                
start:  mov ah,9
        mov dx, offset hd
        int 21h
        mov ah,9
        mov dx, offset hd1
        int 21h
        mov ah,9
        mov dx, offset hd2
        int 21h
        mov ah,9
        mov dx, offset msg
        int 21h
        mov ah,0                       
        int 16h  
        cmp al,31h 
        je kecptn
        cmp al,32h
        je Jarak
        cmp al,33h
        je waktu
        cmp al,34h
        je prcptn
        mov ah,09h
        mov dx, offset msg4
        int 21h
        mov ah,0
        int 16h
        jmp start
        
kecptn:     mov ah,09h
            mov dx, offset msg5
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg4
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            mov ax,bx
            mov cx,dx
            mov dx,0
            mov bx,0
            div cx
            mov bx,dx
            mov dx,ax
            push bx 
            push dx 
            mov ah,9
            mov dx, offset msg7
            int 21h
            mov cx,10000
            pop dx
            call View
            pop bx
            cmp bx,0
            je exit 
            jmp exit             

            
InputNo:    mov ah,0
            int 16h 
            mov dx,0  
            mov bx,1 
            cmp al,0dh
            je FormNo 
            sub ax,30h 
            call ViewNo 
            mov ah,0
            push ax 
            inc cx   
            jmp InputNo          
   


FormNo:     pop ax  
            push dx      
            mul bx
            pop dx
            add dx,ax
            mov ax,bx       
            mov bx,10
            push dx
            mul bx
            pop dx
            mov bx,ax
            dec cx
            cmp cx,0
            jne FormNo
            ret   


       
       
View:  mov ax,dx
       mov dx,0
       div cx 
       call ViewNo
       mov bx,dx 
       mov dx,0
       mov ax,cx 
       mov cx,10
       div cx
       mov dx,bx 
       mov cx,ax
       cmp ax,0
       jne View
       ret


ViewNo:    push ax
           push dx
           mov dx,ax 
           add dl,30h 
           mov ah,2
           int 21h
           pop dx  
           pop ax
           ret
      
   
exit:   mov dx,offset msg8
        mov ah, 09h
        int 21h  


        mov ah, 0
        int 16h

        ret
            
                       
Jarak:   mov ah,09h
            mov dx, offset msg2
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg4
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            mov ax,dx
            mul bx 
            mov dx,ax
            push dx
 
            mov ah,9
            mov dx, offset msg7
            int 21h
            mov cx,10000
            pop dx
            call View 
            jmp exit 


waktu:     mov ah,09h
            mov dx, offset msg5
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg2
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            mov ax,bx
            mov cx,dx
            mov dx,0
            mov bx,0
            div cx
            mov bx,dx
            mov dx,ax
            push bx 
            push dx 
            mov ah,9
            mov dx, offset msg7
            int 21h
            mov cx,10000
            pop dx
            call View
            pop bx
            cmp bx,0
            je exit 
            jmp exit             

                
    
            
prcptn:     mov ah,09h
            mov dx, offset msg5
            int 21h
            mov cx,0
            call InputNo
            push dx
            mov ah,9
            mov dx, offset msg2
            int 21h 
            mov cx,0
            call InputNo
            pop bx
            mov ax,bx
            mov cx,dx
            mov dx,0
            mov bx,0
            div cx
            mov bx,dx
            mov dx,ax
            push bx 
            push dx 
            mov ah,9
            mov dx, offset msg7
            int 21h
            mov cx,10000
            pop dx
            call View
            pop bx
            cmp bx,0
            je exit 
            jmp exit             

                
