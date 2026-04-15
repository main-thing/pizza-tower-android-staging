/// @description nsp_is_string(String)
/// @param String
function nsp_is_string(_a0) {
	/*
	Underlying NSP script.
	*/
	var nspToken=global.nspToken;
	var q;

	q=nspToken[NSP_TOK.quote];

	if string_copy(_a0,1,1)==q and string_copy(_a0,string_length(_a0),1)==q
	&& string_pos(q,nsp_string_crop_ext(_a0,q))=0
	 return true
	  else return false;




}
