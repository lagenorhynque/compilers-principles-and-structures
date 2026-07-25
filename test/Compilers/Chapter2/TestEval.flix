mod Compilers.Chapter2.TestEval {
    use Assert.assertEq
    use Compilers.Chapter2.Eval
    use Compilers.Chapter2.TM.S.{B, I, O}
    use Compilers.Chapter2.TM.p

    @Test
    def testEval(): Unit \ Assert =
        let t = (List#{I, I, I}, I, Nil);
        let r = Eval.eval(p(), t);
        assertEq(expected = (Nil, B, List#{I, O, O, O, O}), r)
}
