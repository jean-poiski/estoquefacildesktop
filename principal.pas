unit Principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, login;

type

  { TfoPrincipal }

  TfoPrincipal = class(TForm)
    sbPrincipal: TStatusBar;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  foPrincipal: TfoPrincipal;

implementation

{$R *.lfm}

{ TfoPrincipal }


procedure TfoPrincipal.FormShow(Sender: TObject);
begin
  foLogin := TfoLogin.Create(Self);
  try
     foLogin.ShowModal;

     if not foLogin.Sucesso then
        Application.Terminate;

  finally
    FreeAndNil(foLogin);
  end;

end;

end.

