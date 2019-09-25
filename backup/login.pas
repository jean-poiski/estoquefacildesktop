unit login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, RTTICtrls;

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
  private

  public

  end;

var
  foLogin: TfoLogin;

implementation

{$R *.lfm}

{ TfoLogin }

procedure TfoLogin.btSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfoLogin.btOkClick(Sender: TObject);
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

end;

end.

