proc demo(alpha=1, beta=2.0, verb=false, item="", files: seq[string]) =
  ## demo entry point with varied, meaningless parameters.
  echo "alpha:", alpha, " beta:", beta, " verb:", verb, " item:", repr(item)
  for i, f in files: echo "args[", i, "]: ", repr(f)

proc show(gamma=1, iota=2.0, verb=false, paths: seq[string]): int =
  ## show entry point with varied, meaningless parameters.
  echo "gamma:", gamma, " iota:", iota, " verb:", verb
  for i, p in paths: echo "args[", i, "]: ", repr(p)
  return 42

proc punt(zeta=1, eta=2.0, verb=false, names: seq[string]): int =
  ## Another entry point; here we echoResult
  echo "zeta:", zeta, " eta:", eta, " verb:", verb
  for i, n in names: echo "args[", i, "]: ", repr(n)
  return 12345

proc nel_Ly(hooves=4, races=9, verb=false, names: seq[string]): string =
  ## Yet another entry point; here we block autoEcho
  echo "hooves:", hooves, " races:", races, " verb:", verb
  for i, n in names: echo "args[", i, "]: ", repr(n)
  return "42"

when isMainModule:
  import cligen; include cligen/mergeCfgEnv
  cligenVersion = "0.0.1"
  dispatchMulti([ "multi", requireSeparator=true ],
                [ demo, help = { "verb": "on=chatty, off=quiet" } ],
                [ show, cmdName="print", short = { "gamma": 'z' } ],
                [ punt, echoResult=true ],
                [ nel_Ly, cmdName="nel-ly", noAutoEcho=true ] )
