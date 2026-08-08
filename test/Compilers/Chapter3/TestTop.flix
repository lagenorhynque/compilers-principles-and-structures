mod Compilers.Chapter3.TestTop {
    use Assert.assertEq
    use Compilers.Chapter3.Top
    use Sys.Console

    @Test
    def testTop(): Unit \ {Assert, IO} =
        let (_, out) = handlePrintln(() -> Top.top(Some("flix.toml")));
        assertEq(
            expected = List#{
                "[package]",
                "name",
                "=",
                "\"compilers-principles-and-structures\""
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
                def print(s, _) = ???
                def eprint(s, _) = ???
                def println(s, resume) = {
                    MutList.push(s, buf);
                    resume()
                }
                def eprintln(s, _) = ???
            }
        }
}
