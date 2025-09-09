object PwdForm: TPwdForm
  Left = 0
  Top = 0
  Caption = #1042#1093#1086#1076
  ClientHeight = 107
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    442
    107)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 72
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object CancelButton: TButton
    Left = 359
    Top = 69
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
    ExplicitLeft = 356
    ExplicitTop = 71
  end
  object OKButton: TButton
    Left = 266
    Top = 69
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    TabOrder = 2
    OnClick = OKButtonClick
    ExplicitLeft = 263
    ExplicitTop = 71
  end
  object LoginEdit: TEdit
    Left = 120
    Top = 8
    Width = 314
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnKeyPress = LoginEditKeyPress
  end
  object PwdEdit: TEdit
    Left = 120
    Top = 37
    Width = 314
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = PwdEditKeyPress
    ExplicitWidth = 311
  end
  object FDQuery: TFDQuery
    CachedUpdates = True
    Connection = DataModule1.FDConnection
    SQL.Strings = (
      'select user from users where user = :user and passw = md5(:pwd)')
    Left = 17
    Top = 60
    ParamData = <
      item
        Name = 'USER'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PWD'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 57
    Top = 60
  end
end
