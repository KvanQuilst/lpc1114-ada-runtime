pragma Style_Checks (off);

with Interfaces.LPC1114;

package System.LPC1114 is
  pragma No_Elaboration_Code_All;
  pragma Preelaborate (System.LPC1114);

  subtype Frequency is Interfaces.LPC1114.UInt32;

end System.LPC1114;
