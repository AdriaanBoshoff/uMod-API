program uMod_API;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uModAPI in 'API\uModAPI.pas',
  uModAPI.Types in 'API\uModAPI.Types.pas';

begin
  try
    var uMod := TuModAPI.Create;
    try
      var response := uMod.SearchPlugins('Gather Manager', 1);

      Writeln('Total: ' + response.rateLimit.total.ToString);
      Writeln('Remaining: ' + response.rateLimit.remaining.ToString);

      for var aplugin in response.plugins do
        Writeln(aplugin.name + ' (' + aplugin.title + ') - ' + aplugin.description);
    finally
      umod.Free;

      ReadLn;
    end;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      ReadLn;
    end;
  end;
end.

