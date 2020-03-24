unit uHerancaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaBase, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Data.DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, uEnum, Vcl.Mask, Vcl.DBCtrls, JvExMask, JvToolEdit, JvDBControls,
  Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker, JvCombobox,
  JvDBCombobox, JvEdit, JvValidateEdit, Vcl.Grids, Vcl.DBGrids,
  ZAbstractConnection, ZConnection;

type
  TfrmHerancaCadastro = class(TfrmHerancaBase)
    pnlPrincipal: TPanel;
    pnlPrincipalBottom: TPanel;
    btnCancelar: TJvImgBtn;
    bntGravar: TJvImgBtn;
    btnApagar: TJvImgBtn;
    QryCadastro: TZQuery;
    updCadastro: TZUpdateSQL;
    dtsCadastro: TDataSource;
    procedure btnApagarMouseEnter(Sender: TObject);
    procedure btnApagarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure bntGravarMouseEnter(Sender: TObject);
    procedure bntGravarMouseLeave(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure bntGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure QryCadastroAfterDelete(DataSet: TDataSet);
    procedure QryCadastroAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    procedure PostOrDeleteWithCommitOrRollback(aConexao: TZConnection;
      aQry: TZQuery);
    procedure ControleEstado(qry: TZQuery; EstadoDoCadastro: TEstadoDoCadastro;
      BtnSalva, btnCancelar, BtnExclui: TJvImgBtn);
    { Private declarations }
  public
    EstadoDoCadastro:TEstadoDoCadastro;
    procedure HabilitaDesabilitaTela(chave: boolean);
    { Public declarations }
  end;

var
  frmHerancaCadastro: TfrmHerancaCadastro;

implementation

{$R *.dfm}

uses uPrincipal, uFuncoes;

procedure TfrmHerancaCadastro.bntGravarClick(Sender: TObject);
begin
  inherited;
  QryCadastro.Post;
  Close;
end;

procedure TfrmHerancaCadastro.bntGravarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 4);
end;

procedure TfrmHerancaCadastro.bntGravarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 5);
end;

procedure TfrmHerancaCadastro.btnApagarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Apagar este Registro?', mtConfirmation, [mbYes, mbNo],0) = IDYES then begin
     QryCadastro.Delete;
     Close;
  end;
end;

procedure TfrmHerancaCadastro.btnApagarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 8);
end;

procedure TfrmHerancaCadastro.btnApagarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 9);
end;

procedure TfrmHerancaCadastro.btnCancelarClick(Sender: TObject);
begin
  inherited;
  QryCadastro.Cancel;
  Close;
end;

procedure TfrmHerancaCadastro.btnCancelarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 6);
end;

procedure TfrmHerancaCadastro.btnCancelarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 7);
end;

procedure TfrmHerancaCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
  begin
    if (qryCadastro.State in [dsInsert, dsEdit]) then
        qryCadastro.Cancel;
    Close;
  end;
end;

procedure TfrmHerancaCadastro.FormShow(Sender: TObject);
begin
  inherited;
  ControleEstado(qryCadastro, EstadoDoCadastro, bntGravar, btnCancelar ,btnApagar);
end;

procedure TfrmHerancaCadastro.HabilitaDesabilitaTela(chave: boolean);
var i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    //81 -> Utilizada para deixar o campo da tela desabilitado,
    //      porem na tela tem que ficar com ENABLED:=FALSE
    if (Components[i] is TDBEdit) and (TDBEdit(Components[i]).Tag<>81) then begin
      TDBEdit(Components[i]).Enabled:=chave;
    end
    else if Components[i] is TDBMemo then begin
      TDBMemo(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TDBImage then begin
      TDBImage(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TDBListBox then begin
      TDBListBox(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TDBComboBox then begin
      TDBComboBox(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TDBCheckBox then begin
      TDBCheckBox(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TDBRadioGroup then begin
      TDBRadioGroup(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TDBLookupComboBox then begin
      TDBLookupComboBox(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TDBRichEdit then begin
      TDBRichEdit(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TJvDBDateEdit then begin
      TJvDBDateEdit(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TJvDBDateTimePicker then begin
      TJvDBDateTimePicker(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TJvDBComboEdit then begin
      TJvDBComboEdit(Components[i]).Enabled:=Chave;
    end
    else if Components[i] is TJvDBComboBOX then begin
      TJvDBComboBOX(Components[i]).Enabled:=Chave;
    end
    else if (Components[i] is TDBGrid) then
      TDBGrid(Components[i]).Enabled:=Chave
    else if (Components[i] is TMaskEdit) then
      TMaskEdit(Components[i]).Enabled:=Chave
    else if (Components[i] is TEdit)  then
      TEdit(Components[i]).Enabled:=Chave
    else if (Components[i] is TJvDateEdit) then
      TJvDateEdit(Components[i]).Enabled:=Chave
    else if (Components[i] is TJvValidateEdit) then
      TJvValidateEdit(Components[i]).Enabled:=Chave;
  end;

end;

procedure TfrmHerancaCadastro.PostOrDeleteWithCommitOrRollback(aConexao: TZConnection;
  aQry: TZQuery);
begin
  Try
    aConexao.StartTransaction;
    aQry.ApplyUpdates;
    aConexao.Commit;
    aQry.Refresh;
  Except
    aConexao.Rollback;
  End;
end;

procedure TfrmHerancaCadastro.QryCadastroAfterDelete(DataSet: TDataSet);
begin
  inherited;
  PostOrDeleteWithCommitOrRollback(dtmConexao.SQLConnection,  QryCadastro);
end;

procedure TfrmHerancaCadastro.QryCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  PostOrDeleteWithCommitOrRollback(dtmConexao.SQLConnection,  QryCadastro);
end;

procedure TfrmHerancaCadastro.ControleEstado(qry: TZQuery;EstadoDoCadastro:TEstadoDoCadastro;
  BtnSalva:TJvImgBtn; btnCancelar:TJvImgBtn; BtnExclui:TJvImgBtn);
begin
  if (EstadoDoCadastro = ecNovo) then begin
     BtnExclui.Visible:=false;
     lblTitulo.Caption:=lblTitulo.Caption+ ' - [NOVO]';
     qry.Append;
  end
  else if (EstadoDoCadastro = ecModificar) then begin
     BtnExclui.Visible:=false;
     lblTitulo.Caption:=lblTitulo.Caption+ ' - [MODIFICAR]';
     qry.Edit;
  end
  else begin
     lblTitulo.Caption:=lblTitulo.Caption+ ' - [APAGAR]';
     BtnExclui.Left:=btnCancelar.Left;
     BtnSalva.Visible:=false;
     btnCancelar.Visible:=false;
     BtnExclui.Visible:=true;
  end;
end;

end.
