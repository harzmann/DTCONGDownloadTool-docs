<?php
/**
 * Ergänzt WooCommerce-Kategorien um sichtbare H1 und individuelle AIOSEO-Metadaten.
 * Die Inhalte der Beschreibungsfelder beginnen jeweils mit der H1 als erster Zeile.
 */

function eh_dtco_category_editorial_data(): array {
	return [
		242 => [
			'h1'   => 'Fuhrparkmanagement: Software, Telematik und Services',
			'title' => 'Fuhrparkmanagement: Software, Telematik & Hardware',
			'meta'  => 'Software, GNSS-Tracker und Services für digitales Fuhrparkmanagement: FLEETFUHRPARK, FLEET Mira und FLEETON Track & Trace entdecken.',
		],
		244 => [
			'h1'   => 'Einrichtung und Installation für Fuhrparksoftware',
			'title' => 'Fuhrparksoftware einrichten & installieren lassen',
			'meta'  => 'Professionelle Einrichtung und Installation von FLEETFUHRPARK für Einzelplatz- und Mehrplatzumgebungen. Schnell produktiv starten.',
		],
		246 => [
			'h1'   => 'GNSS-Tracker und Telematik-Hardware für den Fuhrpark',
			'title' => 'GNSS-Tracker & Telematik-Hardware für Fuhrparks',
			'meta'  => 'GNSS- und GPS-Tracker, OBD2- und CAN-Telematik, Datentarife und Zubehör für FLEETON Track & Trace und digitales Flottenmanagement.',
		],
		243 => [
			'h1'   => 'Fuhrparksoftware für Fahrzeuge, Personal, Kosten und Telematik',
			'title' => 'Fuhrparksoftware kaufen: FLEET Mira & FLEETFUHRPARK',
			'meta'  => 'Fuhrparksoftware für Fahrzeugakten, Termine, Kosten, Werkstatt und Telematik. FLEET Mira, FLEETFUHRPARK und FLEETON vergleichen.',
		],
		227 => [
			'h1'   => 'Elektronische Führerscheinkontrolle für Unternehmen',
			'title' => 'Elektronische Führerscheinkontrolle mit RFID',
			'meta'  => 'Führerscheinkontrolle für Firmenfuhrparks: RFID-Siegel, DLTNG Terminal, mobile Prüfung sowie FLEETON und FLEET Mira Software.',
		],
		240 => [
			'h1'   => 'Einrichtung für elektronische Führerscheinkontrolle',
			'title' => 'Führerscheinkontrolle einrichten lassen | DTCO Terminal',
			'meta'  => 'Professionelle Einrichtung des DTCO Terminals für elektronische Führerscheinkontrollen mit RFID und angebundener Software.',
		],
		232 => [
			'h1'   => 'Hardware für elektronische Führerscheinkontrollen',
			'title' => 'RFID-Terminals & Leser für Führerscheinkontrolle',
			'meta'  => 'DLTNG DTCO Terminal, RFID-Leser und manipulationsgeschützte Siegel für elektronische Führerscheinkontrollen im Firmenfuhrpark.',
		],
		228 => [
			'h1'   => 'Software und Lizenzen für Führerscheinkontrollen',
			'title' => 'Software für elektronische Führerscheinkontrolle',
			'meta'  => 'Führerscheinkontrolle digital verwalten: FLEETON Cloud-Lösung, Fahrer-Lizenzen für DLTNG und lokale Kontrolle mit FLEET Mira.',
		],
		219 => [
			'h1'   => 'Tachographendaten herunterladen, archivieren und auswerten',
			'title' => 'Tachographendaten archivieren & auswerten | FLEET Mira',
			'meta'  => 'Tachographen- und Fahrerkartendaten herunterladen, archivieren und auswerten – mit FLEET Mira, DLTNG Terminal und VDO Smart Download Key.',
		],
		241 => [
			'h1'   => 'Einrichtung von Download-Terminals für Tachographendaten',
			'title' => 'DTCO Download-Terminal einrichten lassen',
			'meta'  => 'Fachgerechte Einrichtung des DTCO Terminals für Fahrer- und Tachographendownloads sowie die angebundene Archivierungssoftware.',
		],
		138 => [
			'h1'   => 'Download-Hardware für digitale Tachographen und Fahrerkarten',
			'title' => 'Tachograph Download-Hardware: DLTNG & VDO Download Key',
			'meta'  => 'DLTNG DTCO Terminals und VDO Smart Download Key für den Download von Fahrer- und Tachographendaten – stationär oder mobil.',
		],
		139 => [
			'h1'   => 'Software für Tachographenarchiv und DDD-Auswertung',
			'title' => 'Tachographen-Software für DDD-Archiv & Analyse',
			'meta'  => 'FLEET Mira für DDD-Dateien: Tachographendaten importieren, hashverifiziert archivieren, auswerten und Downloadfristen überwachen.',
		],
	];
}

function eh_dtco_current_category_data(): ?array {
	if ( ! is_product_category() ) {
		return null;
	}

	$term = get_queried_object();
	$data = eh_dtco_category_editorial_data();

	return isset( $term->term_id, $data[ $term->term_id ] ) ? $data[ $term->term_id ] : null;
}

add_action(
	'woocommerce_archive_description',
	function (): void {
		$data = eh_dtco_current_category_data();
		if ( $data ) {
			echo '<h1 class="woocommerce-products-header__title page-title">' . esc_html( $data['h1'] ) . '</h1>';
		}
	},
	5
);

add_filter(
	'term_description',
	function ( string $description, int $term_id ): string {
		if ( is_admin() || ! is_product_category() ) {
			return $description;
		}

		$data = eh_dtco_category_editorial_data();
		if ( ! isset( $data[ $term_id ] ) ) {
			return $description;
		}

		$parts = preg_split( '/\R+/', trim( $description ), 2 );
		return isset( $parts[1] ) ? trim( $parts[1] ) : '';
	},
	20,
	2
);

add_filter(
	'aioseo_title',
	function ( string $title ): string {
		$data = eh_dtco_current_category_data();
		return $data ? $data['title'] : $title;
	}
);

add_filter(
	'aioseo_description',
	function ( string $description ): string {
		$data = eh_dtco_current_category_data();
		return $data ? $data['meta'] : $description;
	}
);
