pub mod Compilers.Chapter2.TM {
    use Compilers.Chapter2.TM.D.{L, R}
    use Compilers.Chapter2.TM.S.{B, I, O}
    use Compilers.Chapter2.TM.Q.{M, H}

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
    }
    pub type alias Delta = List[((Q, S), (Q, S, D))]
    pub type alias Program = (Q, Delta)
    pub type alias Tape = (List[S], S, List[S])
    pub def p(): Program =
        (M, List#{
            ((M, I), (M, O, L)),
            ((M, O), (H, I, L)),
            ((M, B), (H, I, L))
        })
}
