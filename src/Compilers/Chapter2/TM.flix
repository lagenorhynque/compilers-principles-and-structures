pub mod Compilers.Chapter2.TM {
    use Compilers.Chapter2.TM.A.{Move, Write}
    use Compilers.Chapter2.TM.D.{L, R}
    use Compilers.Chapter2.TM.S.{B, I, O}
    use Compilers.Chapter2.TM.Q.{M, H, Seeked}

    pub enum D with Eq, ToString {
        case L
        case R
    }
    pub enum S with Eq, ToString {
        case B
        case I
        case O
    }
    pub enum Q with Eq, ToString {
        case M
        case H
        case Seeked
    }
    pub enum A with Eq, ToString {
        case Move(D)
        case Write(S)
    }
    pub type alias Delta = List[((Q, S), (Q, A))]
    pub type alias Program = (Q, Delta)
    pub type alias Tape = (List[S], S, List[S])
    pub def p(): Program =
        (Seeked, List#{
            ((Seeked, I), (M, Write(O))),
            ((Seeked, O), (H, Write(I))),
            ((Seeked, B), (H, Write(I))),
            ((M, I), (Seeked, Move(L))),
            ((M, O), (Seeked, Move(L)))
        })
}
