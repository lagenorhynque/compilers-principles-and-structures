pub mod Compilers.Chapter2.Eval {
    use Compilers.Chapter2.TM.{D, Delta, Program, Q, S, Tape}

    def hd(l: List[S]): S =
        match l {
            case Nil => S.B
            case h :: _ => h
        }
    def tl(l: List[S]): List[S] =
        match l {
            case Nil => Nil
            case _ :: t => t
        }
    def cons(h: S, t: List[S]): List[S] =
        match (h, t) {
            case (S.B, nil) => nil
            case (h2, t2) => h2 :: t2
        }
    def moveL(tape: Tape): Tape =
        let (lList, h, rList) = tape;
        (tl(lList), hd(lList), cons(h, rList))
    def moveR(tape: Tape): Tape =
        let (lList, h, rList) = tape;
        (cons(h, lList), hd(rList), tl(rList))
    def move(d: D, tape: Tape): Tape =
        match d {
            case D.L => moveL(tape)
            case D.R => moveR(tape)
        }
    pub def print(q: Q, tape: Tape): Unit \ IO =
        let (lList, h, rList) = tape;
        println("{state = ${q}, tape = ${(List.reverse(lList), h, rList)}}")
    @Tailrec
    def exec(delta: Delta, q: Q, tape: Tape): Tape =
        let (lList, h, rList) = tape;
        match List.findLeft(entry -> fst(entry) == (q, h), delta) {
            case None => tape
            case Some((_, (q2, s, d))) =>
                exec(delta, q2, move(d, (lList, s, rList)))
        }
    pub def eval(program: Program, tape: Tape): Tape =
        let (state, delta) = program;
        exec(delta, state, tape)
}
