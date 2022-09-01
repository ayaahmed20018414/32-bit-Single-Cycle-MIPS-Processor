# 32-bit-Single-Cycle-MIPS-Processor
In this project, I implement a 32-bit single-cycle microarchitecture MIPS processor based on Harvard Architect.  In other words instruction fetch, instruction decode, execute, write back, and program counter update occurs within a single clock cycle. I write the RTL Verilog files for all sub-modules of the MIPS processor (e.g. Register File, Instruction Memory, etc.). Then, implementing the top module of the MIPS processor. The single-cycle microarchitecture executes an entire instruction in one cycle.

Complete single-cycle MIPS processor implementation 
![Screenshot (808)](https://user-images.githubusercontent.com/82789012/187975733-fd1aadc1-9656-4d85-9c1f-109b2ef47658.png)

MIPS single-cycle processor interfaced to external memory.
![Screenshot (810)](https://user-images.githubusercontent.com/82789012/187977353-d0d03c9e-30ac-43f9-9a20-8edbfa920720.png)



in this Project, I ran three projects to test it:
1st program: GCD of 120 and 180, 2nd program: the factorial of 7, 3rd program: the Fibonacci series numbers.

output of 1st Proram GCD of 120 and 180.
![Screenshot (812)](https://user-images.githubusercontent.com/82789012/187982667-e8b0a01b-c033-4b52-b576-d9e668a81dba.png)


output of 2nd Program the factorial of 7.
![Screenshot (814)](https://user-images.githubusercontent.com/82789012/187983044-56a0a7ae-7712-4fd0-bce3-734c6c05aa24.png)

output of the Fibonacci series numbers.
![Screenshot (816)](https://user-images.githubusercontent.com/82789012/187983823-db6077a9-63d8-4519-924f-7e8b4ae65b4d.png)

Finally, I used Quartus (Quartus Prime 18.1) Lite Edition to synthesis and see the RTL implementation of MIPS processor after Design.
![Screenshot (819)](https://user-images.githubusercontent.com/82789012/187985394-df89dcb2-3ec5-41df-8955-23a623f785c4.png)
![Screenshot (821)](https://user-images.githubusercontent.com/82789012/187985678-1a46de6d-4505-46bc-8f76-7c46f1b2125d.png)
![Screenshot (825)](https://user-images.githubusercontent.com/82789012/187985954-6afe934f-9f3b-4548-a5ac-8e5d9077c9de.png)
![Screenshot (826)](https://user-images.githubusercontent.com/82789012/187986085-fafcc16f-9f55-4281-9737-89b96c7b2e94.png)
![Screenshot (827)](https://user-images.githubusercontent.com/82789012/187986301-b42a3faa-757b-4b02-9452-76b58f9dd590.png)






