program p14ProjTp6;

uses
  Vcl.Forms,
  p14Entregable in 'p14Entregable.pas' {Form1},
  diccionario in 'diccionario.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
