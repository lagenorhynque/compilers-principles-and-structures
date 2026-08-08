pub mod Compilers.Chapter2.TM {
    use Compilers.Chapter2.TM.D.{L, R}
    use Compilers.Chapter2.TM.S.{B, I, O}
    use Compilers.Chapter2.TM.Q.{H, Init, M, Seek}

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
        case Init
        case Seek
    }
    pub type alias Delta = List[((Q, S), (Q, S, D))]
    pub type alias Program = (Q, Delta)
    pub type alias Tape = (List[S], S, List[S])
    pub def p(): Program =
        (Init, List#{
            ((Init, B), (Seek, B, R)),
            ((Seek, I), (Seek, I, R)),
            ((Seek, O), (Seek, O, R)),
            ((Seek, B), (M, B, L)),
            ((M, I), (M, O, L)),
            ((M, O), (H, I, L)),
            ((M, B), (H, I, L)),
            ((H, I), (H, I, L)),
            ((H, O), (H, O, L))
        })
}
