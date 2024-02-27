DECLARE @SRV_ORIGEM VARCHAR(100) ;
DECLARE @SRV_DESTINO VARCHAR(100) ;
DECLARE @DATABASE_ORIGEM VARCHAR(100) ;
DECLARE @DATABASE_DESTINO VARCHAR(100) ;
DECLARE @tabelaOrigem VARCHAR(100);
DECLARE @tabelaDestino VARCHAR(100);
DECLARE @sqlQuery NVARCHAR(MAX);
DECLARE @sqlTruncate NVARCHAR(MAX);

  SET @SRV_ORIGEM  = '';
  SET @SRV_DESTINO = '';
  SET @DATABASE_ORIGEM = 'database1';
  SET @DATABASE_DESTINO= 'database2';





SET @tabelaOrigem = @SRV_ORIGEM + @DATABASE_ORIGEM+'.dbo.Tabela';
SET @tabelaDestino = @SRV_DESTINO + @DATABASE_DESTINO + '.dbo.Tabela';
SET @sqlQuery = '
	SET IDENTITY_INSERT '+@tabelaDestino+' ON;  
	INSERT INTO '+@tabelaDestino+ '(id)
		SELECT id
	FROM '+@tabelaOrigem+ ';
    SET IDENTITY_INSERT '+@tabelaDestino+' OFF; 
		
    '

EXEC sp_executesql @sqlQuery;
PRINT 'Exemplo'