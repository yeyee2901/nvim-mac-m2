local ok, jdtls = pcall(require, 'jdtls')

if not ok then 
	return
end

if next(JAVA_CONFIG_JDTLS) == nil then
   return
end

jdtls.start_or_attach(JAVA_CONFIG_JDTLS)
