unit p14Entregable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Tipos, ArbolesBinariosAVL, diccionario,
  strutils;
type
  Vector = Array[0..4] of string;
  TForm1 = class(TForm)
    Texto: TMemo;
    Button1: TButton;
    Palabras: TComboBox;
    Button2: TButton;
    Button3: TButton;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PalabrasKeyPress(Sender: TObject; var Key: Char);
    procedure PalabrasKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A1: ArbolAVL;
  VSimilares: Vector;

implementation

{$R *.dfm}

function PalabrasSimilares(var Ar: ArbolAVL; s: string):String;
var x: tipoelemento; palabra, recup: string;
  p: posicionarbol; i: integer;

  procedure rec(q: posicionarbol);
  begin
     if i > 4 then
       i := 0;
     if (not Ar.RamaNula(Q)) then begin
       x := ar.Recuperar(q);
       recup := leftstr(x.clave, length(s));
       if s = recup then begin
         //flag := true;
         palabra := x.clave;
         Vsimilares[i] := x.clave;
       end
       else begin
       if s = leftstr(x.clave, length(s)-1) then
          Vsimilares[i] := x.clave;
       end;

       inc(i);
       rec(ar.HijoIzquierdo(q));
       rec(ar.HijoDerecho(q));
     end
  end;

begin
  palabra := '';
  i := 0;
  rec(ar.root);
  PalabrasSimilares := palabra;
end;

function VerDiccionario(var Ar: ArbolAVL): string;
var s: string; x, aux: tipoelemento; VMayor: Array of tipoelemento;
    i: integer;

  procedure rec(Q: posicionArbol);
  begin
    if not Ar.RamaNula(Q) then begin
      x := ar.Recuperar(q);
      vmayor[i] := x;
      inc(i);
      rec(Ar.HijoIzquierdo(Q));
      rec(Ar.HijoDerecho(Q));
    end;
  end;

  // Ordenar vector que contiene los elementos para mostrar en el memo.
  procedure ordenar(n: integer);
  var j: integer;
  begin
    if n = (length(vmayor)-1) then exit;

    for j := 0 to length(vmayor)-2 do begin
      if (vmayor[j].Valor1) < (vmayor[j+1].Valor1) then begin
        aux := vmayor[j+1];
        vmayor[j+1] := vmayor[j];
        vmayor[j] := aux;
      end;
    end;
    ordenar(n+1);
  end;

begin
  i := 0;
  setlength(VMayor, ar.CantidadNodos);
  if Ar.EsVacio then
   S := 'No hay elementos en el diccionario todavía.'
  else begin
    s := 'Palabras y cantidad de aparaciones: ' + cCRLF + cCRLF;
    rec(ar.root);
    ordenar(0);

    for i := 0 to length(vmayor)-1 do begin
      s := s + vmayor[i].ArmarString + cCRLF;
    end;

  end;
  VerDiccionario := S;

end;

function PalabrasIguales(Var Ar: ArbolAVL; s: string):Boolean;
var Q: posicionarbol; x, x1: tipoelemento; Repetido: Boolean;
begin
   x.Inicializar(a1.DatoDeLaClave, '');
   x.clave := s;
   Q := Ar.BusquedaBinaria(x);
   x1 := Ar.Recuperar(Q);
   Repetido := False;
   
   if x.clave = x1.clave then begin
      Repetido := True;
   end;
   PalabrasIguales := Repetido;
   
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Texto.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Texto.Lines.add(#13#10 + 'ELEMENTOS EN PREORDEN: ' + A1.PreOrden);
  Texto.Lines.add('ELEMENTOS EN INORDEN: ' + A1.Inorden);
  Texto.Lines.add('ELEMENTOS EN POSTORDEN: ' + A1.PostOrden);
  Texto.Lines.Add(#13#10)
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  diccionario.form2.memo1.clear;
  diccionario.Form2.Show;
  diccionario.form2.Memo1.lines.add(VerDiccionario(A1));
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  A1.Crear(cadena, MAX);
  Texto.Clear;
  for i := 0 to length(vsimilares)-1 do
    vsimilares[i] := '';

end;

procedure TForm1.PalabrasKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #32 then
    key := #00;

  palabras.DroppedDown := true;

end;

procedure TForm1.PalabrasKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var x, x2: tipoelemento; q: posicionarbol; n, i: integer;
    palabra: string; rep1, rep2, rep3, rep4, rep5: boolean;

begin
  if key = VK_BACK then
  for i := 0 to palabras.items.count-1 do
     palabras.items.delete(i);

  palabras.text := trim(palabras.text);
  // Si se presiona espacio...
  if Key = vk_space then begin

    // Agrego al memo la palabra
    Texto.Text := TExto.Text + palabras.Text + ' ';

    if not PalabrasIguales(A1, lowercase(Palabras.Text)) then begin
      // Si la palabra no existe, la inserto en el árbol.
      if length(palabras.text) > 2 then begin
        x.Inicializar(a1.DatoDeLaClave, 1);
        x.clave := lowercase(Palabras.Text);
        A1.Insertar(x);
      end;

      // Si existe, sumo 1 al contador de apariciones en valor1.
    end
    else begin
      if length(palabras.text) > 2 then begin
        x.Inicializar(a1.DatoDeLaClave, '');
        x.clave := lowercase(palabras.text);
        q := a1.BusquedaBinaria(x);
        x2 := a1.Recuperar(q);
        x2.Valor1 := x2.valor1 + 1;
        a1.Eliminar(x);
        a1.Insertar(x2);
      end;

    end;
    // Limpio el edit de la palabra
    palabra := lowercase(palabras.text);
    Palabras.Text := '';
  end;
  palabra := lowercase(palabras.text);

  rep1 := false;
  rep2 := false;
  rep3 := false;
  rep4 := false;
  rep5 := false;

  PalabrasSimilares(a1, palabra);

  for i := 0 to 4 do begin
    if vsimilares[0] = palabras.Items[i] then
      rep1 := true;
    if vsimilares[1] = palabras.Items[i] then
      rep2 := true;
    if vsimilares[2] = palabras.Items[i] then
      rep3 := true;
    if vsimilares[3] = palabras.Items[i] then
      rep4 := true;
    if vsimilares[4] = palabras.Items[i] then
      rep5 := true;
  end;

  if (not rep1) and (vsimilares[0] <> '') then
      palabras.AddItem(vsimilares[0], sender);
  if (not rep2) and (vsimilares[1] <> '') then
      palabras.AddItem(vsimilares[1], sender);
  if (not rep3) and (vsimilares[2] <> '') then
      palabras.AddItem(vsimilares[2], sender);
  if (not rep4) and (vsimilares[3] <> '')  then
      palabras.AddItem(vsimilares[3], sender);
  if (not rep5) and (vsimilares[4] <> '') then
      palabras.AddItem(vsimilares[4], sender);

  if (diccionario.Form2.Showing) and (key = vk_space) then begin
      diccionario.form2.memo1.clear;
      diccionario.form2.Memo1.lines.add(VerDiccionario(A1));
  end;

  for i := 0 to palabras.items.count-1 do
    if palabra <> leftstr(palabras.items[i], length(palabra)) then
      palabras.items.delete(i);

  for i := 0 to length(vsimilares)-1 do
      vsimilares[i] := '';

  if palabras.text = '' then
      palabras.clear;
end;

end.
