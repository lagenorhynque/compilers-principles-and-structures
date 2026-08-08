pub mod Compilers.Chapter2.Main {
    use Compilers.Chapter2.Eval
    use Compilers.Chapter2.TM.S.{B, I}
    use Compilers.Chapter2.TM.p

    pub def main(): Unit \ IO =
        let t = (Nil, B, List#{I, I, I, I});
        let r = Eval.eval(p(), t);
        println("{t = ${t}, r = ${r}}")
}
