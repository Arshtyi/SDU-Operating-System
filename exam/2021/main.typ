#import "@preview/ezexam:0.3.1": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/subpar:0.2.2"
#import "@preview/cetz:0.5.2": canvas, draw

#show: setup.with(
    mode: EXAM,
    resume: false,
    heading-top: 0em,
    heading-bottom: .4em,
    line-height: .5em,
    par-spacing: .5em,
    enum-spacing: .5em,
    list-spacing: .5em,
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
    班级: "21数据·21智能",
    源码: link("https://github.com/arshtyi/SDU-Operating-System", "link"),
))

= 简答
#question[解释进程和线程的关系。]
#question[一个进程的虚拟地址空间中，数据段、代码段、堆段、栈段是否都可以被进程的各线程共享？为什么？]
#question[解释"一切皆文件"思想并说明其优劣。]
#question[互斥主要有$4$类解决方法：软件实现、关中断、原子指令、信号量。选择一种方法，用代码演示如何正确访问临界资源。]
#question[解释批处理系统与分时处理系统。]
#question[说明如何实现输出重定向。]
= 程序运行
#question[
    编译链接下述C程序生成可执行程序a.out。
    ```c
    int main() {
        printf("Hello, world!\n");
        return 0;
    }
    ```
    在命令窗口输入```sh a.out```并回车后到屏幕输出"Hello, world!"的过程中，操作系统对a.out的处理与执行过程。
]
= 页面调度
#question[
    假设某进程按照$0,1,0,2,0,3,0,4,3,2,1,0$顺序访问虚拟页面，且操作系统为该进程准备了$3$个可供请求分页的物理页面。假设初始时该进程没有任何物理页面。
    + 按照最长前向距离(LFD)页面置换算法，列出每次访问时调入的虚拟页面的页号（若某次访问不调入页面则写"-"，答案格式为"$0,1,-,dots$"）。
    + 按照先进先出页面替换算法，列出每次访问时调入的虚拟页面的页号。
    + 按照最久未用页面替换算法，列出每次访问时调入的虚拟页面的页号。
    + 增加资源总量（如内存总量、页面数）反而导致性能下降和效率降低的现象称作什么？
    + 最长前向距离页面替换算法为什么难以在现实系统中使用？
]
= 死锁
#question[
    假设系统当前资源分配如下：
    // @typstyle off
    #figure(table(
        columns: 10,
        inset: 10pt,
        table.header([资源表], table.cell(colspan: 3)[已分配$U$], table.cell(colspan: 3)[最大$M$], table.cell(colspan: 3)[剩余量$A$]),
        [指令流], $R_1$, $R_2$, $R_3$, $R_1$, $R_2$, $R_3$, $R_1$, $R_2$, $R_3$,
        $A$, $1$, $1$, $0$, $7$, $5$, $3$, table.cell(rowspan: 5, $3$), table.cell(rowspan: 5, $3$), table.cell(rowspan: 5, $3$),
        $B$, $2$, $0$, $0$, $3$, $2$, $3$,
        $C$, $3$, $0$, $2$, $9$, $0$, $2$,
        $D$, $2$, $1$, $1$, $2$, $3$, $2$,
        $E$, $0$, $0$, $2$, $4$, $3$, $3$
    ))
    + 求系统当前状态的需求矩阵$N$。
    + 系统当前是否处于安全状态？若是，给出安全执行顺序，在其中指令流尽量按照$E -> A$的顺序执行完毕（即若有两个可执行，选择字母字典序更大的优先执行）；若否，给出理由。
    + 在当前执行情况下，指令流$A$请求分配$(0,2,1)$，是否允许此次分配。若是，给出安全执行顺序（优先级同(2)）；若否，给出理由。
    + 进入不安全状态的系统在什么前提下才一定会死锁？
]
= 用户态与内核态
#question[
    CPU提供了用户态与核心态两种运行模式。
    + 二者有何区别？
    + 二者对现代操作系统设计有何帮助？
    + C语句```c printf("Hello World\n")```会陷入内核态执行吗？为什么？
    + C语句```c double y = cos(13)```会陷入内核态执行吗？为什么？
]
= 文件系统
#question[
    给定以下目录与文件结构以及对应的文件索引图。
    #subpar.grid(
        figure(
            diagram(
                node-shape: rect,
                node-stroke: .5pt,
                node((0, 0), "/(Root)"),
                edge("ld"),
                edge("rd"),
                node((-1, 1), "D1"),
                edge("d"),
                node((1, 1), "D2"),
                node((-1, 2), "a.txt", stroke: none),
            ),
        ),
        figure(canvas({
            import draw: *
            let s = (paint: black, thickness: 0.8pt)
            let box(a, b, body) = {
                rect(a, b, stroke: s)
                content(((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2), body)
            }

            // 左侧：D1 目录
            rect((0, 4.2), (3.2, 5.8), stroke: s)
            line((0, 5.0), (3.2, 5.0), stroke: s)
            line((2.1, 4.2), (2.1, 5.0), stroke: s)
            content((1.6, 5.4), [D1目录])
            content((1.05, 4.6), [a.txt])
            content((2.65, 4.6), [3])

            // 左下：D2 目录
            box((0, 1.0), (3.2, 1.8), [D2目录])

            // 中间：索引节点表
            rect((5.2, 0.8), (8.6, 5.8), stroke: s)
            line((5.2, 5.0), (8.6, 5.0), stroke: s)
            line((5.2, 3.95), (8.6, 3.95), stroke: s)
            line((5.2, 2.9), (8.6, 2.9), stroke: s)
            line((5.2, 1.85), (8.6, 1.85), stroke: s)
            line((6.55, 0.8), (6.55, 5.0), stroke: s)

            content((6.9, 5.4), [索引节点表])
            content((5.875, 4.45), [0])
            content((7.575, 4.45), [FCB])
            content((5.875, 3.425), [1])
            content((7.575, 3.425), [FCB])
            content((5.875, 2.375), [2])
            content((7.575, 2.375), [FCB])
            content((5.875, 1.325), [3])
            content((7.575, 1.325), [FCB])

            // 右侧数据块
            box((10.3, 5.1), (13.2, 5.9), [Root数据块])
            box((10.3, 3.9), (13.2, 4.7), [D1数据块])
            box((10.3, 2.7), (13.2, 3.5), [D2数据块])
            box((10.3, 1.5), (13.2, 2.3), [a.txt数据块])

            // 箭头
            line((3.2, 4.6), (5.2, 1.325), stroke: s, mark: (fill: black, end: ">"))

            line((8.6, 4.45), (10.3, 5.5), stroke: s, mark: (fill: black, end: ">"))
            line((8.6, 3.425), (10.3, 4.3), stroke: s, mark: (fill: black, end: ">"))
            line((8.6, 2.375), (10.3, 3.1), stroke: s, mark: (fill: black, end: ">"))
            line((8.6, 1.325), (10.3, 1.9), stroke: s, mark: (fill: black, end: ">"))
        })),
    )
    + 在原始状态基础上，移动```txt /D1/a.txt -> /D2/a.txt```，画出文件索引图。
    + 在原始状态基础上，复制```txt /D1/a.txt -> /D2/a.txt```，画出文件索引图。
    + 在原始状态基础上，在D2目录下创建名为a.link对应/D1/a.txt的硬链接，画出文件索引图。
    + 在原始状态基础上，在D2目录下创建名为a.link对应/D1/a.txt的软链接，画出文件索引图。
    + FCB与数据块的索引有多种方式（如连续分配、链表分配、索引分配），解释混合索引的思想。
]
= 线程调度
#question[
    #let number-line(from: -5, to: 5, step: 1, text: "时间") = canvas(length: .7cm, {
        import draw: *
        line((from, 0), (to + 1.2, 0), mark: (fill: black, end: ">"))
        for x in range(from, to + 1, step: step) {
            line((x, -.1), (x, .1))
            content((x, -.3), str(x), anchor: "north")
        }
        content((to + 1, -.3), text, anchor: "north")
    })
    三个线程$E_1,E_2,E_3$参数如下，提交给操作系统调度。
    #figure(table(
        columns: 4,
        inset: 10pt,
        [线程], [到达时间], [运行时长], [优先数（越小越重要）],
        $E_1$, $1$, $5$, $3$,
        $E_2$, $3$, $3$, $2$,
        $E_3$, $5$, $1$, $1$,
    ))
    + 短作业优先，非抢占式。画出调度情况。#number-line(from: 1, to: 20)
    + 短作业优先，抢占式。画出调度情况。#number-line(from: 1, to: 20)
    + 时间片轮转法（时间片长度为$1$）。画出调度情况。#number-line(from: 1, to: 20)
    + 单一的调度算法各有缺点。什么是多级队列调度算法？什么是多级反馈队列调度算法？
    + 线程有$5$个基本状态，画出线程状态转移图。
]
#question[
    某进程中有$3$个工作线程T1，T2，T3和一个负责同步与互斥机制初始化的线程T4，伪代码如下。该进程启动后，```c main```函数先启动线程T4并等待其初始化所有同步与互斥机制，T4退出后才启动并发执行的T1，T2，T3。
    #grid(
        columns: (1fr,) * 3,
        stroke: .6pt,
        inset: 2pt,
        [
            ```c
            // 复数的结构类型定义
            typedef struct
            {
                float a;
                float b;
            } cnum;

            cnum x, y, z; // 全局变量

            // 计算两个复数之和
            cnum add(cnum &p, cnum &q)
            {
                cnum s;

                s.a = p.a + q.a;
                s.b = p.b + q.b;

                return s;
            }
            ```

            T4
            ```c
            // 初始化代码
            ```
        ],
        [
            T1
            ```c
            cnum w;

            while(1) // 不断运行
            {
                w = add(x, y);
                ...... // 使用w
            }
            ```

            T2
            ```c
            cnum w;

            while(1) // 不断运行
            {
                w = add(y, z);
                ...... // 使用w
            }
            ```
        ],
        [
            T3
            ```c
            cnum w = {2.0f, 3.0f};

            // 初始化全局变量
            x.a = 1.0f;
            x.b = 5.0f;
            y.a = 8.0f;
            y.b = 6.0f;
            z.a = 4.0f;
            z.b = 7.0f;

            while(1) // 不断运行
            {
                // 延时一小时
                delay(ONE_HOUR);
                // 要求xyz一起更新
                x = add(x, w);
                y = add(y, w);
                z = add(z, w);
            }
            ```
        ],
    )
    + 指出T1，T2，T3中哪些线程是读者，哪些线程是写者，以及为何要互斥访问x，y，z。
    + 重写T1，T2，T3线程的```c while```循环，在内部添加必要的互斥锁```c lock```和```c unlock```操作，和/或信号量```c acquire```和```c release```操作，保证程序的正确执行；添加使用到的互斥锁和信号量进全局变量，并重写T4线程以在其中初始化它们（```c minit```初始化互斥锁，```c sinit```初始化信号量），但不需要考虑互斥锁和信号浪的销毁。在答案中，不需要抄写复数的结构类型定义和计算复数和的子程序。信号量与互斥锁声明和使用的样例如下：
        ```c
        mutex_t mutex; minit(&mutex); lock(&mutex); unlock(&mutex);
        sem_t sem; sinit(&sem, number); acquire(&sem); release(&sem);
        ```
    + 补充要求-正确初始化：在(2)中，额外修改```c while```循环之前的代码，要求确保全局变量x，y，z初始化完成前读者不会启动读操作。
]
