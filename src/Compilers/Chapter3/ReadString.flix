pub mod Compilers.Chapter3.ReadString {
    import java.io.PushbackReader

    pub enum Error with ToString {
        case EOF
    }

    pub def skipSpaces(pr: PushbackReader): Result[Error, Unit] \ IO =
        let i = pr.read();
        if (i == -1) Err(Error.EOF)
        else {
            let c = Int32.truncateToChar(i);
            if (Char.isWhitespace(c)) skipSpaces(pr)
            else Ok(pr.unread(i))
        }

    pub def readString(pr: PushbackReader): Result[Error, String] \ IO =
        def readRest(s) = {
            let i = pr.read();
            if (i == -1) Err(Error.EOF)
            else {
                let c = Int32.truncateToChar(i);
                if (Char.isWhitespace(c)) {
                    pr.unread(i);
                    Ok(s)
                } else readRest("${s}${c}")
            }
        };
        readRest("")
}
