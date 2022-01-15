<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	<html>
		<head>
			<title>Faktury</title>
			<style type="text/css">
			* {
					margin: 0;
					padding: 0;
					font-family: Montserrat, Arial;
				}

				body {
					font-height: 20px;
					max-width: 1000px;
					margin: 20 auto;
				}
				#wrapper {
					max-width: 1200px;
					margin: 10 auto;
					background-color: #e9e9e9;
				}


				h1, h2 {
					font-family: Dancing Script, arial;
					text-align: center;
					padding:20px;
				}
				
				.sprzedawca {
					display: inline-block;
					margin: 30px 5px;
					padding: 15px;
					width: 45%;
					float: left;
					border: 1px solid #999999;
					border-radius: 7px;
					background-color: #f5f5f5;
					box-shadow: 5px 3px 3px rgba(0, 0, 0, .3);
				}
				.nabywca {
					display: inline-block;
					margin: 30px 5px;
					padding: 15px;
					width: 45%;
					float: right;
					border: 1px solid #999999;
					border-radius: 7px;
					background-color: #f5f5f5;
					box-shadow: 5px 3px 3px rgba(0, 0, 0, .3);
				}

				.line {
					display: block;
					<!--height: 20px;-->
					margin: 2px;
				}

				.data {
					display: inline-block;
					<!--margin-left: 0px;-->
				}
				
				.tabela {
					max-width: 900 px; 
					margin: 10px; 
				}
				
				.liczby {
					text-align:inherit;
				}

				footer {
					clear: both;
				}
			</style>
		</head>
		<body>
		<div id="wrapper">
			<h1>Faktura</h1>
			<xsl:for-each select="faktury/faktura[@id='f2']">
			<p style="text-align:center;">Numer faktury: <xsl:value-of select="fakturaVAT"/></p>
			<p style="margin: 10px; float:right; font-weight: bold;">Numer zamówienia: <xsl:value-of select="nrzamowienia"/></p>
			<p style="margin: 10px;">Data zamówienia: <xsl:value-of select="datazamowienia"/></p>
			<p style="margin: 10px;">Data wystawienia: <xsl:value-of select="datawystawienia"/></p>
			</xsl:for-each>
					<div class="sprzedawca">
						<div class="line">
							<span class="data"><p style="font-weight: bold;">Sprzedawca: </p><xsl:value-of select="faktury/faktura[@id='f2']/sprzedawca/nazwa"/></span>
						</div>
						<xsl:for-each select="faktury/faktura[@id='f2']/sprzedawca/adres">
						<div class="line">
							<span class="data"><p style="font-weight: bold;">Adres: </p>
							<p>Ulica<xsl:value-of select="concat(' ', ulica,' ', nrbudynku)"/></p>
							<p><xsl:value-of select="kod"/><xsl:value-of select="concat(' ', miejscowosc)"/></p>
							</span>
						</div>
						</xsl:for-each>
						<div class="line">
							<span class="data"><p style="font-weight: bold;">Nr nip: </p><xsl:value-of select="faktury/faktura[@id='f2']/sprzedawca/nrnip"/></span>
						</div>
					</div>
					<div class="nabywca">
						<div class="line">
							<span class="data"><p style="font-weight: bold;">Nabywca: </p><xsl:value-of select="faktury/faktura[@id='f2']/nabywca/nazwa"/></span>
						</div>
						<xsl:for-each select="faktury/faktura[@id='f2']/nabywca/adres">
						<div class="line">
							<span class="data"><p style="font-weight: bold;">Adres: </p>
							<p>Ulica<xsl:value-of select="concat(' ', ulica,' ', nrbudynku, '/', nrlokalu)"/></p>
							<p><xsl:value-of select="kod"/><xsl:value-of select="concat(' ', miejscowosc)"/></p>
							</span>
						</div>
						</xsl:for-each>
						<div class="line">
							<span class="data"><p style="font-weight: bold;">Nr nip: </p><xsl:value-of select="faktury/faktura[@id='f2']/nabywca/nrnip"/></span>
						</div>
					</div> 
					<div class="tabela">
						<table border="1">
						  <tr bgcolor="#9acd32">
								<th>Lp</th>
								<th>Kod artykułu</th>
								<th>Nazwa artykułu</th>
								<th style="padding: 0px 8px">Ilość</th>
								<th>JM</th>
								<th>Cena jednostkowa brutto po rabacie </th>
								<th>Stawka VAT</th>
								<th>Wartość VAT</th>
								<th>Wartość sprzedaży brutto</th>
								<th>Kwota podatku</th>
							  </tr>
						<xsl:for-each select="faktury/faktura[@id='f2']/zamowienie/pozycja">
						<!--<xsl:if test="ilosc>=2">-->
							<tr>
								<td>
									<xsl:value-of select="lp"/>
								</td>
								<td style="text-align:center">
									<xsl:value-of select="kodart"/>
								</td>
								<td>
									<xsl:value-of select="nazwaartykulu"/>
								</td>
								<td style="text-align:center">
									<xsl:value-of select="ilosc"/>
								</td>
								<td style="padding: 0px 8px">
									<xsl:value-of select="jm"/>
								</td>
									<td style="text-align:right">
										<xsl:value-of select="cenajednostkowabruttoporabacie"/>
									</td>
									<td style="text-align:right">
										<xsl:value-of select="stawkaVAT"/>
									</td>
									<td style="text-align:right">
										<xsl:value-of select="wartoscVAT"/>
									</td>
									<td style="text-align:right; font-weight: bold;">
										<xsl:value-of select="wartoscsprzedazybrutto"/>
									</td>
									<td style="text-align:right">
										<xsl:value-of select="kwotapodatku"/>
									</td>
							</tr>
						<!--</xsl:if>-->
						</xsl:for-each>
						</table>
					</div>
					<table border="1" style="float: right; margin:10px;">
						  <tr bgcolor="#9acd32">
								<th>Wartość całkowita VAT</th>
								<th>Wartość całkowita brutto</th>
								<th>Waluta</th>
							  </tr>
						<xsl:for-each select="faktury/faktura[@id='f2']/zamowienie">
						<!--<xsl:if test="ilosc>=2">-->
							<tr>
								<td style="text-align:center">
									<xsl:value-of select="wartosccalkowitanetto"/>
								</td>
								<td style="text-align:center; font-weight: bold;">
									<xsl:value-of select="wartosccalkowitabrutto"/>
								</td>
								<td style="text-align:center">
									<xsl:value-of select="waluta"/>
								</td>
							</tr>
						<!--</xsl:if>-->
						</xsl:for-each>
						</table>
						<p  style="margin:20px; font-weight: bold;">Płatność: <xsl:value-of select="faktury/faktura[@id='f2']/zamowienie/platnosc"/></p>
		
		<footer>
			<hr/>
		</footer>
		</div>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>
