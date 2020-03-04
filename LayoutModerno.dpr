program LayoutModerno;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uSplash in 'uSplash.pas' {frmSplash},
  uHerancaBase in 'uHerancaBase.pas' {frmHerancaBase},
  uHerancaListagem in 'uHerancaListagem.pas' {frmHerancaListagem},
  uHerancaCadastro in 'uHerancaCadastro.pas' {frmHerancaCadastro},
  uFuncoes in 'uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
