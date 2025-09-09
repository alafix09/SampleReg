//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DtModule.h"
#include "TruckEditFormUnit.h"
#include "SampleEditFormUnit.h"
#include "PwdFormUnit.h"
#include "TrucksFormUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TTrucksForm *TrucksForm;
//---------------------------------------------------------------------------
__fastcall TTrucksForm::TTrucksForm(TComponent* Owner)
	: TForm(Owner)
{
	clickCounter = 0;
	ByDateTimePicker->Date = Date();
	FromDateTimePicker->Date = Date() - 3;
}
//---------------------------------------------------------------------------
void __fastcall TTrucksForm::FDQuery1AfterPost(TDataSet *DataSet)
{
//	Label1->Caption = FDQuery1->ChangeCount;
}
//---------------------------------------------------------------------------
void TTrucksForm::editTruck(bool newRecord)
{
	if (newRecord || !FDQuery1->Eof)
	{
		TTruckEditForm *form;
		form = new TTruckEditForm(this);
		if (newRecord)
			form->setId(-1);
		else
			form->setId(FDQuery1->FieldByName("TID")->AsInteger);
		if (form->ShowModal() == mrOk)
		{
			FDQuery1->Refresh();
		}
		delete form;
	}
}

void TTrucksForm::editSample(bool newRecord)
{
	TSampleEditForm *form;
	if (newRecord || !FDQuery2->Eof)
	{
		form = new TSampleEditForm(this);
		if (newRecord)
			form->setId(-1);
		else
			form->setId(FDQuery2->FieldByName("SID")->AsInteger);
		if (form->ShowModal() == mrOk)
		{
			FDQuery2->Refresh();
		}
		delete form;
	}
}



void TTrucksForm::refresh()
{
	TDate dateBy, dateFrom;

	dateFrom = FromDateTimePicker->Date;
	dateBy = ByDateTimePicker->Date + 1;

	FDQuery1->Close();
	FDQuery1->ParamByName("DateFrom")->AsDate = dateFrom;
	FDQuery1->ParamByName("DateBy")->AsDate = dateBy;
	FDQuery1->Open();

	FDQuery2->Close();
	FDQuery2->ParamByName("DateFrom")->AsDate = dateFrom;
	FDQuery2->ParamByName("DateBy")->AsDate = dateBy;
	FDQuery2->Open();


}


void __fastcall TTrucksForm::DBGrid1DblClick(TObject *Sender)
{
	if (ClickTimer1->Enabled)
	{
		ClickTimer1->Enabled = false;
		editTruck(false);
	}
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::DBGrid1CellClick(TColumn *Column)
{
	ClickTimer1->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::ClickTimer1Timer(TObject *Sender)
{
	ClickTimer1->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::ByDateTimePickerChange(TObject *Sender)
{
	refresh();
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::FormShow(TObject *Sender)
{
	refresh();
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::DBGrid1KeyPress(TObject *Sender, System::WideChar &Key)

{
	if (Key == 13)
	{
		editTruck(false);
	}
}
//---------------------------------------------------------------------------


void __fastcall TTrucksForm::FormResize(TObject *Sender)
{
	int width, height, hindent;

	width = ClientWidth;
	height = ClientHeight;
	hindent = DBGrid1->Left;
	width = (ClientWidth - 3 * hindent) / 2;
	DBGrid1->Width = width;
	DBGrid2->Left = DBGrid1->Left + width + hindent;
	DBGrid2->Width = width;
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::ClickTimer2Timer(TObject *Sender)
{
	ClickTimer2->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::DBGrid2CellClick(TColumn *Column)
{
	ClickTimer2->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::DBGrid2DblClick(TObject *Sender)
{
	if (ClickTimer2->Enabled)
	{
		ClickTimer2->Enabled = false;
		editSample(false);
	}

}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::Button1Click(TObject *Sender)
{
	editTruck(true);
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::DBGrid2KeyPress(TObject *Sender, System::WideChar &Key)

{
	if (Key == 13)
	{
		editSample(false);
	}
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::RefreshTimerTimer(TObject *Sender)
{
	if (FDQuery1->Active)
		FDQuery1->Refresh();
	if (FDQuery2->Active)
		FDQuery2->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TTrucksForm::FormClose(TObject *Sender, TCloseAction &Action)
{
    exit(0);
}
//---------------------------------------------------------------------------



