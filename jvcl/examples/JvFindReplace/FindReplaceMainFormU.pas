unit FindReplaceMainFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, JvFindReplace, JvComponent, ExtCtrls;

type
  TFindReplaceMainForm = class(TForm)
    FindReplace1: TJvFindReplace;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Search1: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    FindAgain1: TMenuItem;
    Serachown1: TMenuItem;
    Find2: TMenuItem;
    Replace2: TMenuItem;
    FindAgain2: TMenuItem;
    Options1: TMenuItem;
    Rememberlastsearch1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    procedure Find1Click(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
    procedure FindAgain1Click(Sender: TObject);
    procedure FindReplace1NotFound(Sender: TObject);
    procedure FindReplace1Find(Sender: TObject);
    procedure FindReplace1Replace(Sender: TObject);
    procedure Find2Click(Sender: TObject);
    procedure Replace2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FindAgain2Click(Sender: TObject);
    procedure FindReplace1Show(Sender: TObject);
    procedure FindReplace1Close(Sender: TObject);
    procedure Rememberlastsearch1Click(Sender: TObject);
  private
    { Private declarations }
    FOptions:TFindOptions;
    FCount:integer;
  end;

var
  FindReplaceMainForm: TFindReplaceMainForm;

implementation

{$R *.DFM}

procedure TFindReplaceMainForm.Find1Click(Sender: TObject);
begin
  FindReplace1.ShowDialogs := True;
  FindReplace1.Find;
end;

procedure TFindReplaceMainForm.Replace1Click(Sender: TObject);
begin
  FindReplace1.ShowDialogs := True;
  FindReplace1.Replace;
end;

procedure TFindReplaceMainForm.FindAgain1Click(Sender: TObject);
begin
  { reset to saved options }
  FindReplace1.Options := FOptions;
  FindReplace1.FindAgain;
end;

procedure TFindReplaceMainForm.FindReplace1NotFound(Sender: TObject);
begin
  if not FindReplace1.ShowDialogs then
    ShowMessage('Text not found!');
  Caption := 'Not found! ' + IntToStr(FCount);
  Inc(FCount);
end;

procedure TFindReplaceMainForm.FindReplace1Find(Sender: TObject);
begin
  FOptions := FindReplace1.Options;
  Caption := 'Find next clicked! ' + IntToStr(FCount);
  Inc(FCount);
end;

procedure TFindReplaceMainForm.FindReplace1Replace(Sender: TObject);
begin
  Caption := 'Replace clicked! '  + IntToStr(FCount);
  Inc(FCount);
end;

procedure TFindReplaceMainForm.Find2Click(Sender: TObject);
var S:string;
begin
  S := FindReplace1.FindText;
  if InputQuery('Find','Search for:',S) then
  begin
    FindReplace1.ShowDialogs := False;
    FindReplace1.FindText := S;
    FindReplace1.Find;
  end;
end;

procedure TFindReplaceMainForm.Replace2Click(Sender: TObject);
var S,R:string;
begin
   S := FindReplace1.FindText;
   R := FindReplace1.ReplaceText;
   if InputQuery('Find','Find text:',S) then
     if InputQuery('Replace','Replace with:',R) then
     begin
       FindReplace1.ShowDialogs := False;
       FindReplace1.FindText := S;
       FindReplace1.ReplaceText := R;
       FindReplace1.Replace;
     end;
end;

procedure TFindReplaceMainForm.FormCreate(Sender: TObject);
begin
  Fcount := 0;
end;

procedure TFindReplaceMainForm.FindAgain2Click(Sender: TObject);
begin
  FindReplace1.FindAgain;
end;

procedure TFindReplaceMainForm.FindReplace1Show(Sender: TObject);
begin
  Caption := 'Showing';
end;

procedure TFindReplaceMainForm.FindReplace1Close(Sender: TObject);
begin
  Caption := 'Closing';
end;

procedure TFindReplaceMainForm.Rememberlastsearch1Click(Sender: TObject);
begin
   Rememberlastsearch1.Checked := not Rememberlastsearch1.Checked;
   FindReplace1.Keeptext := Rememberlastsearch1.Checked;
end;

end.
