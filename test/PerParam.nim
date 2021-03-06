proc demo(al_pha=1, be_ta=2.0, verb=false, item="", args: seq[string]) =
  ## demo entry point with varied, meaningless parameters.  A Nim invocation
  ## might be: demo(alpha=2, @[ "hi", "ho" ]) corresponding to the command
  ## invocation "demo --alpha=2 hi ho" (assuming executable gets named demo).
  echo "alpha:", alpha, " beta:", beta, " verb:", verb, " item:", repr(item)
  for i, arg in args: echo "positional[", i, "]: ", repr(arg)

when isMainModule:
  import cligen
  dispatch(demo,
           help = { "al_pha" : "growth constant",
                    "be_ta"  : "shrink target" },
           short = { "al_pha" : 'z',
                     "be_ta" : '\0' })
