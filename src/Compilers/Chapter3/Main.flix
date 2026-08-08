pub mod Compilers.Chapter3.Main {
    use Compilers.Chapter3.Top
    use Sys.{Console, Env}

    pub def main(): Unit \ {Console, Env, IO} =
        let fileName = Env.getArgs() |> List.head;
        Top.top(fileName)
}
