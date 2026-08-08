mod Compilers.Chapter2.TestEval {
    use Assert.assertEq
    use Compilers.Chapter2.Eval
    use Compilers.Chapter2.TM.S.{B, I, O}
    use Compilers.Chapter2.TM.p

    @Test
    def testEval(): Unit \ Assert =
        List#{
            (List#{I, I, I, I}, List#{I, O, O, O, O}),
            (List#{I, I, O}, List#{I, I, I}),
            (List#{I, O, I}, List#{I, I, O}),
            (List#{I, O, O}, List#{I, O, I}),
            (List#{O}, List#{I})
        }
            |> List.forEach(ts ->
                let (in, out) = ts;
                let t = (Nil, B, in);
                let r = Eval.eval(p(), t);
                assertEq(expected = (Nil, B, out), r)
            )
}
