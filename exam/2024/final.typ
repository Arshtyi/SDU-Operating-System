#import "@preview/ezexam:0.3.1": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *

#show: setup.with(
    mode: EXAM,
    resume: false,
    heading-top: 0em,
    heading-bottom: .4em,
    line-height: .65em,
    par-spacing: .65em,
    enum-spacing: .65em,
    list-spacing: .65em,
)
#set par(justify: true)
#show raw: set text(font: "JetBrains Mono")
#show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: .3em, y: 0em),
    outset: (x: 0em, y: .3em),
    radius: .2em,
)
#show: codly-init
#codly(
    languages: codly-languages,
    fill: luma(97.2%),
    stroke: .5pt + rgb("bfbfbf"),
    radius: 8pt,
)
#let Title = "山东大学计算机科学与技术学院操作系统期末考试"
#let author = "arshtyi"
#let date = datetime.today()
#set document(title: Title, author: author, date: date)
#title(Title)
#exam-info(info: (
    班级: "24数据·24智能",
    教师: "刘健中",
    时间: datetime(year: 2026, month: 7, day: 6).display("[year].[month].[day]"),
    源码: link("https://github.com/arshtyi/SDU-Operating-System", "link"),
))
#let paren = paren.with(placeholder: none)
#let fillin = fillin.with(placeholder: none)
#let choices = choices.with(r-gap: .5em)

= 单选
#question[
    在较高抽象层次上描述操作系统各项逻辑功能的是#paren[]。
    #choices[设计][实现][策略][机制]
]
#question[
    按一定顺序逐一执行事先编组好的成批计算任务的是#paren[]。
    #choices[实时操作系统][批处理操作系统][分时操作系统][微内核操作系统]
]
#question[
    UNIX 系统中*最不常见*的可执行文件与进程的对应关系是#paren[]。
    #choices[一对一][多对一][一对多][均常见]
]
#question[
    内核级线程运行时，CPU 状态可能是#paren[]。
    #choices[内核态][用户态][均不是][均有可能]
]
#question[
    课内所学的内存分配方法中，最适合进程内存需求大小呈正态分布的是#paren[]。
    #choices[固定分区法][最好适配法][最坏适配法][均可以]
]
#question[
    响应比的定义是#paren[]。
    #choices[$1+T/R$][$1+T/W$][$1+W/R$][$W/R$]
]
#question[
    关于虚拟地址和物理地址，正确的是#paren[]。
    #choices[虚拟地址一定对应物理地址][计算机可以没有物理地址][虚拟地址不等于物理地址][虚拟地址可以对应设备端口]
]
#question[
    现实中不可能实现的页面置换算法是#paren[]。
    #choices[LFU][LFD][LRU][FIFO]
]
#question[
    关于软链接和硬链接，正确的是#paren[]。
    #choices[所有操作系统均支持软链接][所有操作系统均支持硬链接][硬链接本质上是文件][软链接本质上是指针]
]
#question[
    关于信号量和条件变量，正确的是#paren[]。
    #choices[条件变量总能替代信号量][信号量总能替代条件变量][条件变量不一定需要配合锁][信号量必须要配合锁]
]
= 填空
#question[
    操作系统最常见的三种结构是#fillin[]、#fillin[]、#fillin[]。
]
#question[
    程序的链接方法中，通常因性能较好而选择的是#fillin[]，因分发方便而选择的是#fillin[]。
]
#question[
    线程的三个基本状态是#fillin[]、#fillin[]、#fillin[]。
]
#question[
    线程与指令流的对应关系是#fillin[]、#fillin[]。
]
#question[
    进程控制块至少包含#fillin[]。
]
#question[
    将协作执行的条件放宽，允许一个指令流在任意时刻被打断，并插入新的指令流执行，称为#fillin[]。如果多个指令流依附于多个分别运行在不同物理处理器上的线程，则又称为#fillin[]。
]
#question[
    文件存储的三种基本分配方法是#fillin[]、#fillin[]、#fillin[]。
]
#question[
    从某个目录D起始，经逐级查找能够定位文件F的路径，称为#fillin[]；文件F相对于系统根目录的路径称为#fillin[]。
]
#question[
    电梯扫描算法的四种常见变体是#fillin[]、#fillin[]、#fillin[]、#fillin[]。
]
#question[
    区分高速设备和低速设备的标准是#fillin[]。
]
#question[
    按数据传输单位分类，硬盘是#fillin[]，鼠标是#fillin[]。
]
#question[
    条件变量等待操作的核心是原子性地#fillin[]。
]
#question[
    课内所学的、最初由大学生开发且后来极为成功的开源操作系统是#fillin[]。
]
#question[
    仅考虑发起操作的接口，阻塞接口一定是（同步/异步）#fillin[]的；异步接口一定是（阻塞/非阻塞）#fillin[]的。
]
#question[
    当系统进入不安全状态时，系统（一定/不一定）#fillin[]会发生死锁。
]
= 名词解释
#question[
    操作系统。
]
#question[
    抢占式 SJF 调度算法及其规则。
]
#question[
    中期调度和短期调度的定义。
]
#question[
    内部碎片和外部碎片的定义。
]
#question[
    好的阻塞锁的$4$个标准。
]
= 简答
#question[
    设磁盘有$16$个磁道，依次编号为$0$到$15$，初始时磁头位于$7$号磁道。现一次性提交磁道访问请求序列$1-8-2-13-3-15$。
    + 什么是 SSTF 算法和 FIFO 算法。
    + 给出 FIFO 算法的访问顺序和磁头移动距离。
    + 给出 SSTF 算法的访问顺序和磁头移动距离。
    + SSTF 可能导致什么现象？为什么？
]
#question[
    设 FCB、文件块、设备块大小相同。文件 B 的绝对路径是`/A/B`，且文件系统还存在一个 FSSB，其中包含根目录下所有文件的 FCB。不考虑操作系统对文件系统数据结构的缓存；以下磁盘访问次数均包含最后访问文件内容的一次；访问文件系统数据结构时，均可读取其所在的完整一块。
    + 文件系统的最基本功能。FCB 的中文名称。
    + 使用连续存储法，访问 A 目录需要访问磁盘几次？
    + 在(2)的前提下，访问文件 B 需要访问磁盘几次？
    + 使用不带优化、不采用混合索引的固定大小一级索引表，访问文件 B 需要访问磁盘几次？过程是怎样的？
    + 使用带固定大小索引表的一级混合索引且索引表可直接存储小文件内容时，访问文件 B 所需磁盘访问次数的区间是多少？（可以先给出过程）
]
= 程序设计
#question[
    在 OpenMP 等并行编程框架中会有类似下面的代码：
    ```c
    parfor (int i = 0; i < N; i++) {        // N个线程
        parallel_work1(i);                  // 分别执行
    }
    wait_parallel_work1_finish();           // 等待全部执行完毕
    parfor (int i = 0; i < N; i++) {        // N个线程
        parallel_work2(i);                  // 分别执行
    }
    ```
    其中 ```c parfor``` 表示 parallel for；简单情形下，它并行启动 $N$ 个任务，并等待全部执行完毕后继续下一步（这里假设代码本身没有共享资源竞争）。下设$N=100$。
    + 假设所有任务（```c parallel_work1()```和```c parallel_work2()```）执行时间均为$1$单位时间，且等待本身（```c wait_parallel_work1_finish()```）不消耗时间。考虑不同数量物理 CPU 的情形，求该程序总用时。
    + 使用条件变量和至多一个用于计数的```c int```变量补全```c wait_parallel_work1_finish()```。（可以给出必要初始化，并假设其在程序开始时执行）可能用到的样例：
        ```c
        mut_t mut = mut_init(); lock(mut); unlock(mut);
        cnd_t cnd = cnd_init(); wait(mut, cnd); wake(cnd); wakeall(cnd);
        ```
    + 给出(2)中不使用```c wakeall(cnd)```的版本。
]
