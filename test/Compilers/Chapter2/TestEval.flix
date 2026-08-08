mod Compilers.Chapter2.TestEval {
    use Assert.assertEq
    use Compilers.Chapter2.Eval
    use Compilers.Chapter2.TM.S.{B, I, O}
    use Compilers.Chapter2.TM.p

    @Test
    def testEval(): Unit \ Assert =
        List#{
            // 1111 -> 1000
            ((List#{I, I, I}, I, Nil), (Nil, I, List#{O, O, O, O})),
            // 110 -> 111
            ((List#{I, I}, O, Nil), (List#{I, I}, I, Nil)),
            // 101 -> 110
            ((List#{O, I}, I, Nil), (List#{I}, I, List#{O})),
            // 100 -> 101
            ((List#{O, I}, O, Nil), (List#{O, I}, I, Nil)),
            // 0 -> 1
            ((Nil, O, Nil), (Nil, I, Nil))
        }
            |> List.forEach(ts ->
                let (in, out) = ts;
                let r = Eval.eval(p(), in);
                assertEq(expected = out, r)
            )
}
