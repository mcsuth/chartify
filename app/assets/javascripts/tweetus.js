function popitup(url) {
  newwindow=window.open(url,'name','height=250,width=650,toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no,');
  if (window.focus) {newwindow.focus()}
  return false;
}