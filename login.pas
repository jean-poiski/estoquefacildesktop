unit login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, RTTICtrls, indylaz, IdHTTP, fpjson;

type

  { TfoLogin }

  TfoLogin = class(TForm)
    btSair: TBitBtn;
    btOk: TBitBtn;
    edSenha: TLabeledEdit;
    GroupBox1: TGroupBox;
    edUsuario: TLabeledEdit;
    procedure btOkClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FSucesso: Boolean;
    FConexao: TIdHTTP;

  public
    property Sucesso: Boolean read FSucesso;

  end;

var
  foLogin: TfoLogin;

implementation

{$R *.lfm}

{ TfoLogin }

procedure TfoLogin.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfoLogin.FormCreate(Sender: TObject);
begin
  FSucesso := False;
  FConexao := TIdHTTP.Create(Self);
end;

procedure TfoLogin.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FConexao);
end;

procedure TfoLogin.btOkClick(Sender: TObject);
var
  input, output : TStringStream;
  JSONLogin : TJSONObject;
begin
  if Trim(edUsuario.Text) = EmptyStr then
  begin
    ShowMessage('Informe seu usuário');
    Exit;
  end;

  if Trim(edSenha.Text) = EmptyStr then
  begin
    ShowMessage('Informe sua senha');
    Exit;
  end;


  output := TStringStream.Create('');
  JSONLogin := TJSONObject.Create;
  try
    try
      JSONLogin.Add('usuario', Trim(edUsuario.Text));
      JSONLogin.Add('senha', edSenha.Text);

      input := TStringStream.Create(JSONLogin.AsJSON);

      FConexao.Post('http://localhost:8080/usuario/logar', input, output);

      ShowMessage(output.DataString);

      FSucesso := True;
      Close;
    except
       on e: EIdHTTPProtocolException do
       begin
         ShowMessage(e.ErrorMessage);
       end;
       on e: Exception do
       begin
         ShowMessage('Falha na aplicação: ' + e.Message);
       end;
    end;
  finally
    FreeAndNil(input);
    FreeAndNil(output);
    FreeAndNil(JSONLogin);
  end;

end;

end.

