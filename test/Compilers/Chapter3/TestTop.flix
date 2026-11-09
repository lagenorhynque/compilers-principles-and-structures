mod Compilers.Chapter3.TestTop {
    use Assert.assertEq
    use Compilers.Chapter3.Top
    use Sys.Console

    @Test
    def testTop(): Unit \ {Assert, IO} =
        let (_, out) = handlePrintln(() -> Top.top("flix.toml"));
        assertEq(
            expected = List#{
                "[package]",
                "version",
                "=",
                "\"0.1.0\""
            },
            List.take(4, out)
        )

    def handlePrintln(f: Unit -> a \ ef): (a, List[String]) \ ef - Console =
        region rc {
            let buf = MutList.empty(rc);
            run {
                (f(), MutList.toList(buf))
            } with handler Console {
                def readln(_) = ???
                def write(_s, _) = ???
                def writeLine(s, resume) = {
                    MutList.push(s, buf);
                    resume()
                }
                def writeErr(_s, _) = ???
                def writeErrLine(_s, _) = ???
            }
        }
}
