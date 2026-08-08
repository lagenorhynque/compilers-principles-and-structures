pub mod Compilers.Chapter3.Top {
    use Compilers.Chapter3.ReadString
    use Sys.Console
    import java.io.{FileReader, PushbackReader}

    def readAndPrintLoop(pr: PushbackReader): Result[ReadString.Error, Unit] \ {Console, IO} =
        forM(
            _ <- ReadString.skipSpaces(pr);
            s <- ReadString.readString(pr);
            _ = Console.println(s);
            _ <- readAndPrintLoop(pr)
        ) yield ()

    pub def top(file: String): Unit \ {Console, IO} =
        let pr = new PushbackReader(new FileReader(file));
        readAndPrintLoop(pr) |> Result.getWithDefault(())
}
