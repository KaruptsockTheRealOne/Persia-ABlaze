LuaQ                   $      $@  @   �       lotatc_cutils_load    lotatc_cutils_run                       E@  �   ��  \���   �    @    serialize = function(val)
    if type(val)=='number' or type(val)=='boolean' then
      return tostring(val)
    elseif type(val)=='string' then
      return string.format("%q", val)
    elseif type(val)=='table' then
      local k,v
      local str = '{'
      for k,v in pairs(val) do
        str=str..'['..serialize(k)..']='..serialize(v)..','
      end
      str = str..'}'
      return str
    end
    return 'nil'
  end
  atc_get_dcs_options = function()
    if options.plugins.LotAtc then
      return options.plugins.LotAtc
    else
      return {}
    end
  end
      lotatc_cutils_run    CUtils load                     !   #        �   �@     @� �  �    �       lotatc_utils_run    config                             