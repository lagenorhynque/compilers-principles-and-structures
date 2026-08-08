pub mod Compilers.Chapter3.Top {
    use Compilers.Chapter3.ReadString
    use Sys.Console
    import java.io.{FileReader, InputStreamReader, PushbackReader}
    import java.lang.System

    def readAndPrintLoop(pr: PushbackReader): Result[ReadString.Error, Unit] \ {Console, IO} =
        forM(
            _ <- ReadString.skipSpaces(pr);
            s <- ReadString.readString(pr);
            _ = Console.println(s);
            _ <- readAndPrintLoop(pr)
        ) yield ()

    pub def top(file: Option[String]): Unit \ {Console, IO} =
        let pr =  Option.foldLeft((_, f) ->
            new PushbackReader(new FileReader(f)),
            new PushbackReader(new InputStreamReader(System.in)),
            file
        );
        readAndPrintLoop(pr) |> Result.getWithDefault(())
}
