$ErrorActionPreference = 'Stop'

function New-ResponsiveSearchAd {
    param(
        [string]$Campaign,
        [string]$AdGroup,
        [string[]]$Headlines,
        [string[]]$Descriptions,
        [string]$Path1,
        [string]$Path2,
        [string]$FinalUrl
    )

    if ($Headlines.Count -lt 10) {
        throw "$Campaign / $AdGroup has fewer than 10 headlines."
    }
    if ($Descriptions.Count -ne 4) {
        throw "$Campaign / $AdGroup does not have exactly 4 descriptions."
    }

    foreach ($headline in $Headlines) {
        if ($headline.Length -gt 30) {
            throw "Headline exceeds 30 characters ($($headline.Length)): $headline"
        }
    }
    foreach ($description in $Descriptions) {
        if ($description.Length -gt 90) {
            throw "Description exceeds 90 characters ($($description.Length)): $description"
        }
    }
    if ($Path1.Length -gt 15 -or $Path2.Length -gt 15) {
        throw "Display path exceeds 15 characters: $Path1 / $Path2"
    }

    $row = [ordered]@{
        'Row Type'     = 'Ad'
        'Action'       = 'Add'
        'Ad status'    = 'Enabled'
        'Campaign'     = $Campaign
        'Ad group'     = $AdGroup
        'Ad type'      = 'Responsive search ad'
    }

    for ($i = 1; $i -le 10; $i++) {
        $row["Headline $i"] = $Headlines[$i - 1]
    }
    for ($i = 1; $i -le 4; $i++) {
        $row["Description $i"] = $Descriptions[$i - 1]
    }

    $row['Path 1'] = $Path1
    $row['Path 2'] = $Path2
    $row['Final URL'] = $FinalUrl

    [pscustomobject]$row
}

$englishBasicHeadlines = @(
    'Fleet Mira Basic',
    'Free Tachograph Management',
    'Free DDD File Management',
    'Archive DDD Files Locally',
    'Analyse Tachograph Data',
    'Manage Driver Card Files',
    'Free Windows Software',
    'Start With Fleet Mira',
    'Basic Without Subscription',
    'Upgrade To Pro Anytime'
)

$englishBasicDescriptions = @(
    'Use FLEET Mira Basic free to archive and manage tachograph and driver card files.',
    'Store DDD files locally on Windows and identify missing downloads and archive gaps.',
    'Start with the free Basic edition and test all Pro features for 30 days.',
    'Download FLEET Mira Basic and upgrade only when you need additional features.'
)

$ads = @()

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | FR 2026' `
    -AdGroup 'FLEET Mira' `
    -Headlines @(
        'FLEET Mira',
        'Logiciel Tachygraphe',
        'Archives DDD Locales',
        'Analysez Vos Fichiers DDD',
        'Gérez Les Cartes Conducteur',
        'Repérez Les Fichiers Manquants',
        '30 Jours Pro Gratuits',
        'Logiciel Windows',
        'Gestion Des Tachographes',
        'Achetez FLEET Mira Pro'
    ) `
    -Descriptions @(
        'Gérez et archivez localement les fichiers DDD des conducteurs et des véhicules.',
        'Analysez les données et repérez les téléchargements ou archives manquants.',
        'Testez toutes les fonctions Pro pendant 30 jours sur votre ordinateur Windows.',
        'Commandez FLEET Mira Pro ou commencez gratuitement avec la version Basic.'
    ) `
    -Path1 'fleet-mira' -Path2 'pro' `
    -FinalUrl 'https://dtco.info/fr/produkt/fleet-mira-pro%f0%9f%92%8e/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | FR 2026' `
    -AdGroup 'FLEET Mira Basic | EN' `
    -Headlines $englishBasicHeadlines `
    -Descriptions $englishBasicDescriptions `
    -Path1 'fleet-mira' -Path2 'basic' `
    -FinalUrl 'https://dtco.info/fr/produkt/fleet-mira-basic/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | FR 2026' `
    -AdGroup 'DLTNG' `
    -Headlines @(
        'Terminal DLTNG DTCO',
        'Borne Carte Conducteur',
        'Téléchargez Les Cartes',
        'Station Centrale DDD',
        'Pour Conducteurs Et Flottes',
        'Avec FLEET Mira',
        'Contrôle Permis En Option',
        'Terminal Tachygraphe',
        'Commande En Ligne',
        'Solution De Téléchargement'
    ) `
    -Descriptions @(
        'Les conducteurs téléchargent eux-mêmes leurs cartes sur une station centrale.',
        'Centralisez les fichiers DDD et combinez le terminal avec le logiciel FLEET Mira.',
        'Ajoutez en option le contrôle du permis de conduire à votre terminal DLTNG.',
        'Découvrez le terminal DLTNG DTCO et commandez directement dans notre boutique.'
    ) `
    -Path1 'dltng' -Path2 'terminal' `
    -FinalUrl 'https://dtco.info/fr/produkt/dltng-dtco-terminal/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | FR 2026' `
    -AdGroup 'VDO Smart Download Key' `
    -Headlines @(
        'VDO Smart Download Key',
        'Clé VDO Pour Tachygraphe',
        'Compatible DTCO 4.1',
        'Téléchargement Mobile',
        'Données Du Tachygraphe',
        'Matériel VDO Compact',
        'Avec FLEET Mira',
        'Achetez En Ligne',
        'Pour Tachygraphes Smart',
        'Téléchargez Les Données'
    ) `
    -Descriptions @(
        'Téléchargez les données directement sur le tachygraphe avec la clé compacte VDO.',
        'La VDO Smart Download Key est prête pour les tachygraphes numériques actuels.',
        'Transférez ensuite les fichiers DDD vers FLEET Mira pour les gérer et les analyser.',
        'Commandez la VDO DLK Smart Download Key directement dans notre boutique en ligne.'
    ) `
    -Path1 'vdo' -Path2 'download-key' `
    -FinalUrl 'https://dtco.info/fr/produkt/vdo-dlk-smart-downloadkey-dtco-4-1-ready/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | ES' `
    -AdGroup 'FLEET Mira' `
    -Headlines @(
        'FLEET Mira',
        'Software Para Tacógrafo',
        'Archivo Local De DDD',
        'Analice Archivos DDD',
        'Gestione Tarjetas De Conductor',
        'Detecte Archivos Faltantes',
        'Prueba Pro De 30 Días',
        'Software Para Windows',
        'Gestión Del Tacógrafo',
        'Compre FLEET Mira Pro'
    ) `
    -Descriptions @(
        'Gestione y archive localmente archivos DDD de conductores y vehículos.',
        'Analice los datos y detecte descargas pendientes o huecos en el archivo.',
        'Pruebe todas las funciones Pro durante 30 días en su ordenador Windows.',
        'Compre FLEET Mira Pro o empiece gratis con la edición Basic.'
    ) `
    -Path1 'fleet-mira' -Path2 'pro' `
    -FinalUrl 'https://dtco.info/es/produkt/fleet-mira-pro%f0%9f%92%8e/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | ES' `
    -AdGroup 'FLEET Mira Basic | EN' `
    -Headlines $englishBasicHeadlines `
    -Descriptions $englishBasicDescriptions `
    -Path1 'fleet-mira' -Path2 'basic' `
    -FinalUrl 'https://dtco.info/es/produkt/fleet-mira-basic/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | ES' `
    -AdGroup 'DLTNG' `
    -Headlines @(
        'Terminal DLTNG DTCO',
        'Terminal Tarjeta Conductor',
        'Descargue Tarjetas',
        'Estación Central DDD',
        'Para Conductores Y Flotas',
        'Con FLEET Mira',
        'Control De Permiso Opcional',
        'Terminal Para Tacógrafo',
        'Compra Online Directa',
        'Solución De Descarga'
    ) `
    -Descriptions @(
        'Los conductores descargan sus tarjetas de forma autónoma en una estación central.',
        'Centralice los archivos DDD y combine el terminal con el software FLEET Mira.',
        'Añada opcionalmente el control del permiso de conducir al terminal DLTNG.',
        'Descubra el terminal DLTNG DTCO y cómprelo directamente en nuestra tienda online.'
    ) `
    -Path1 'dltng' -Path2 'terminal' `
    -FinalUrl 'https://dtco.info/es/produkt/dltng-dtco-terminal/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | ES' `
    -AdGroup 'VDO Smart Download Key' `
    -Headlines @(
        'VDO Smart Download Key',
        'Llave VDO Para Tacógrafo',
        'Compatible Con DTCO 4.1',
        'Descarga Móvil',
        'Datos Del Tacógrafo',
        'Hardware VDO Compacto',
        'Con FLEET Mira',
        'Compre Online',
        'Para Tacógrafos Smart',
        'Descargue Los Datos'
    ) `
    -Descriptions @(
        'Descargue datos directamente del tacógrafo con la llave compacta de VDO.',
        'La VDO Smart Download Key está preparada para tacógrafos digitales actuales.',
        'Transfiera después los archivos DDD a FLEET Mira para gestionarlos y analizarlos.',
        'Compre la VDO DLK Smart Download Key directamente en nuestra tienda online.'
    ) `
    -Path1 'vdo' -Path2 'download-key' `
    -FinalUrl 'https://dtco.info/es/produkt/vdo-dlk-smart-downloadkey-dtco-4-1-ready/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | PL' `
    -AdGroup 'FLEET Mira' `
    -Headlines @(
        'FLEET Mira',
        'Program Do Tachografu',
        'Lokalne Archiwum DDD',
        'Analizuj Pliki DDD',
        'Zarządzaj Kartami Kierowców',
        'Wykrywaj Brakujące Pliki',
        '30 Dni Wersji Pro',
        'Program Dla Windows',
        'Zarządzanie Tachografem',
        'Kup FLEET Mira Pro'
    ) `
    -Descriptions @(
        'Zarządzaj i archiwizuj lokalnie pliki DDD kierowców oraz pojazdów.',
        'Analizuj dane i wykrywaj brakujące pobrania lub luki w archiwum.',
        'Testuj wszystkie funkcje Pro przez 30 dni na komputerze z Windows.',
        'Kup FLEET Mira Pro albo zacznij bezpłatnie od wersji Basic.'
    ) `
    -Path1 'fleet-mira' -Path2 'pro' `
    -FinalUrl 'https://dtco.info/pl/produkt/fleet-mira-pro%f0%9f%92%8e/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | PL' `
    -AdGroup 'FLEET Mira Basic | EN' `
    -Headlines $englishBasicHeadlines `
    -Descriptions $englishBasicDescriptions `
    -Path1 'fleet-mira' -Path2 'basic' `
    -FinalUrl 'https://dtco.info/pl/produkt/fleet-mira-basic/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | PL' `
    -AdGroup 'DLTNG' `
    -Headlines @(
        'Terminal DLTNG DTCO',
        'Terminal Kart Kierowców',
        'Pobieraj Dane Z Kart',
        'Centralna Stacja DDD',
        'Dla Kierowców I Flot',
        'Z FLEET Mira',
        'Kontrola Prawa Jazdy',
        'Terminal Do Tachografu',
        'Kup Online',
        'Rozwiązanie Do Pobierania'
    ) `
    -Descriptions @(
        'Kierowcy samodzielnie pobierają dane z kart w centralnej stacji.',
        'Centralizuj pliki DDD i połącz terminal z oprogramowaniem FLEET Mira.',
        'Opcjonalnie dodaj kontrolę prawa jazdy do terminala DLTNG.',
        'Poznaj terminal DLTNG DTCO i zamów go bezpośrednio w naszym sklepie online.'
    ) `
    -Path1 'dltng' -Path2 'terminal' `
    -FinalUrl 'https://dtco.info/pl/produkt/dltng-dtco-terminal/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | PL' `
    -AdGroup 'VDO Smart Download Key' `
    -Headlines @(
        'VDO Smart Download Key',
        'Klucz VDO Do Tachografu',
        'Gotowy Na DTCO 4.1',
        'Mobilne Pobieranie',
        'Dane Z Tachografu',
        'Kompaktowy Sprzęt VDO',
        'Z FLEET Mira',
        'Kup Online',
        'Do Smart Tachografów',
        'Pobieraj Dane'
    ) `
    -Descriptions @(
        'Pobieraj dane bezpośrednio z tachografu za pomocą kompaktowego klucza VDO.',
        'VDO Smart Download Key jest gotowy do pracy z aktualnymi tachografami cyfrowymi.',
        'Przenieś pliki DDD do FLEET Mira, aby nimi zarządzać i je analizować.',
        'Zamów VDO DLK Smart Download Key bezpośrednio w naszym sklepie online.'
    ) `
    -Path1 'vdo' -Path2 'download-key' `
    -FinalUrl 'https://dtco.info/pl/produkt/vdo-dlk-smart-downloadkey-dtco-4-1-ready/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | IT' `
    -AdGroup 'FLEET Mira' `
    -Headlines @(
        'FLEET Mira',
        'Software Per Tachigrafo',
        'Archivio DDD Locale',
        'Analizza I File DDD',
        'Gestisci Carte Conducente',
        'Trova I File Mancanti',
        'Prova Pro Di 30 Giorni',
        'Software Per Windows',
        'Gestione Del Tachigrafo',
        'Acquista FLEET Mira Pro'
    ) `
    -Descriptions @(
        'Gestisci e archivia localmente i file DDD di conducenti e veicoli.',
        'Analizza i dati e individua download mancanti o lacune nell archivio.',
        'Prova tutte le funzioni Pro per 30 giorni sul tuo computer Windows.',
        'Acquista FLEET Mira Pro oppure inizia gratis con la versione Basic.'
    ) `
    -Path1 'fleet-mira' -Path2 'pro' `
    -FinalUrl 'https://dtco.info/it/produkt/fleet-mira-pro%f0%9f%92%8e/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | IT' `
    -AdGroup 'FLEET Mira Basic | EN' `
    -Headlines $englishBasicHeadlines `
    -Descriptions $englishBasicDescriptions `
    -Path1 'fleet-mira' -Path2 'basic' `
    -FinalUrl 'https://dtco.info/it/produkt/fleet-mira-basic/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | IT' `
    -AdGroup 'DLTNG' `
    -Headlines @(
        'Terminale DLTNG DTCO',
        'Terminale Carta Conducente',
        'Scarica Le Carte',
        'Stazione Centrale DDD',
        'Per Conducenti E Flotte',
        'Con FLEET Mira',
        'Controllo Patente Opzionale',
        'Terminale Per Tachigrafo',
        'Acquista Online',
        'Soluzione Per Il Download'
    ) `
    -Descriptions @(
        'I conducenti scaricano autonomamente le proprie carte in una stazione centrale.',
        'Centralizza i file DDD e collega il terminale al software FLEET Mira.',
        'Aggiungi come opzione il controllo della patente al terminale DLTNG.',
        'Scopri il terminale DLTNG DTCO e acquistalo direttamente nel nostro shop online.'
    ) `
    -Path1 'dltng' -Path2 'terminal' `
    -FinalUrl 'https://dtco.info/it/produkt/dltng-dtco-terminal/'

$ads += New-ResponsiveSearchAd `
    -Campaign 'Search | FLEET Produkte | IT' `
    -AdGroup 'VDO Smart Download Key' `
    -Headlines @(
        'VDO Smart Download Key',
        'Chiave VDO Per Tachigrafo',
        'Compatibile Con DTCO 4.1',
        'Download Mobile',
        'Dati Del Tachigrafo',
        'Hardware VDO Compatto',
        'Con FLEET Mira',
        'Acquista Online',
        'Per Tachigrafi Smart',
        'Scarica I Dati'
    ) `
    -Descriptions @(
        'Scarica i dati direttamente dal tachigrafo con la chiave compatta VDO.',
        'La VDO Smart Download Key è pronta per i tachigrafi digitali attuali.',
        'Trasferisci poi i file DDD in FLEET Mira per gestirli e analizzarli.',
        'Acquista VDO DLK Smart Download Key direttamente nel nostro shop online.'
    ) `
    -Path1 'vdo' -Path2 'download-key' `
    -FinalUrl 'https://dtco.info/it/produkt/vdo-dlk-smart-downloadkey-dtco-4-1-ready/'

$outputPath = Join-Path $PSScriptRoot 'google-ads-international-responsive-search-ads.csv'
$ads | Export-Csv -LiteralPath $outputPath -NoTypeInformation -Encoding utf8

$ads | Select-Object Campaign, 'Ad group', 'Final URL'
Write-Output "Created $($ads.Count) ads at $outputPath"
