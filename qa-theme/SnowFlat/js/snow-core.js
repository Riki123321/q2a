/*
	Q2A Market (c) Jatin Soni
	http://www.q2amarket.com/

	File:           js/snow-core.js
	Version:        Snow 1.4
	Description:    JavaScript helpers for SnowFlat theme

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.
*/
$(document).ready(function () {

	/**
	 * Account menu box toggle script
	 */
	$('#qam-account-toggle').click(function (e) {
		e.stopPropagation();
		$(this).toggleClass('account-active');
		$('.qam-account-items').slideToggle(100);
	});

	$(document).click(function () {
		$('#qam-account-toggle.account-active').removeClass('account-active');
		$('.qam-account-items:visible').slideUp(100);
	});

	$('.qam-account-items').click(function (event) {
		event.stopPropagation();
	});

	/**
	 * Main navigation toggle script
	 */
	$('.qam-menu-toggle').click(function () {
		$('.qa-nav-main').slideToggle(100);
		$(this).toggleClass('current');
	});

	/*
	 * Sidepannel Toggle Click Function
	 */
	$('#qam-sidepanel-toggle').click(function () {
		$('#qam-sidepanel-mobile').toggleClass('open');
		$(this).toggleClass('active');
		$(this).find('i').toggleClass('icon-right-open-big');
	});

	/**
	 * Toggle search box for small screen
	 */
	$('#qam-search-mobile').click(function () {
		$(this).toggleClass('active');
		$('#the-top-search').slideToggle('fast');
	});

	/*
	 * add wrapper to the message sent note 'td'
	 */
	$('.qa-part-form-message .qa-form-tall-ok').wrapInner('<div class="qam-pm-message"></div>');

	// fix the visible issue for main nav, top search-box
	$(window).resize(function () {
		if (window.matchMedia('(min-width: 980px)').matches) {
			$(".qam-search.the-top .qa-search").hide();
			$(".qa-nav-main").show('fast', function () { $(this).css('display', 'inline-block'); });
		} else {
			$(".qam-search.the-top .qa-search").show();
			$(".qa-nav-main").hide();
			$('.qam-menu-toggle').removeClass('current');
		}
	});


	var User = {
		"interfaceLanguage": {
			"current": "pol",
			"available": ["pol", "eng", "deu"]
		},
		"contentLanguage": {
			"current": "eng",
			"available": ["pol", "eng", "deu"]
		},
		"service": {
			"current": {
				"id": "shop",
				"name": "IdoSell Shop2"
			},
			"available": [
				{
					"id": "shop",
					"name": "IdoSell Shop"
				},
				{
					"id": "booking",
					"name": "IdoSell Booking"
				}
			]
		},
		"endpointUrl": "/change-language"
	};

	let changeLanguage = {
		"POL": ["Język interfejsu", "Język zawartości", "Wyślij"],
		"ENG": ["Interface language", "Content language", "Submit"]
	};

	let inputsInterfaceLanguges = document.querySelectorAll(".available-languages-interface > label > input");
	let inputsContentLanguges = document.querySelectorAll(".available-languages-content > label > input");
	let inputsService = document.querySelectorAll(".service-wrapper > label > input");
	let sidePanel = document.querySelector("#qam-sidepanel-toggle");
	const menuList = document.querySelector(".qa-nav-main-list");
	const menuListMobile = document.querySelector(".qa-sidebar");
	let selectListService = document.querySelector(".service-select");
	const filePath = "http://q2a.idosell.com/qa-theme/SnowFlat/images/";

	const listLangugeCreate = () => { 
		let listInterface = '', listContent = '', listService = "";
		let sizeOfImage = 20, sizeOfImageMain = 50;
		menuList.lastChild.innerHTML = '';
		menuListMobile.innerHTML = '';


		if (window.innerWidth < 1000)
			sizeOfImage = 30;

		User.interfaceLanguage.available.map(value => {
			let check = "";
			if (User.interfaceLanguage.current == value)
				check = "checked";

			listInterface += `<label>
								<img src="` + filePath + value.toLowerCase() + `.png" alt="` + User.interfaceLanguage.current.toLowerCase() + `" width="` + sizeOfImage + `" height="` + sizeOfImage + `" />
								<input type="radio" name="interfaceLanguage" value="` + value + `" autocomplete="off" ` + check + `>
							</label>`;
		})

		User.contentLanguage.available.map(value => {
			let check = "";
			if (User.interfaceLanguage.current == value)
				check = "checked";
			listContent += `<label>
								<img src="`+ filePath + value.toLowerCase() + `.png" alt="` + User.interfaceLanguage.current.toLowerCase() + `" width="` + sizeOfImage + `" height="` + sizeOfImage + `"  />
								<input type="radio" name="contentLanguage" value="` + value + `" autocomplete="off" ` + check + `>
							</label>`;
		});

		const language = `
							<div class="dropdown-content"> 
								<form method="GET" name="formlanguage">
									<label class="language-label-interface">Interface language</label>
									<div class="interface-wrapper">
										<label>
											<img class="interface-wrapper-current" src="`+ filePath + User.interfaceLanguage.current.toLowerCase() + `.png" alt="` + User.interfaceLanguage.current.toLowerCase() + `" width="` + sizeOfImage + `" height="` + sizeOfImage + `"  />
											<input type="radio" value="` + User.interfaceLanguage.current + `" autocomplete="off" checked>
										</label>
										<div class="available-languages available-languages-interface">
											`+ listInterface + `
										</div>
									</div>
									<label class="language-label-content">Content language</label>
									<div class="content-wrapper">
										<label>
											<img class="content-wrapper-current"  src="` + filePath + User.contentLanguage.current.toLowerCase() + `.png" alt="` + User.interfaceLanguage.current.toLowerCase() + `" width="` + sizeOfImage + `" height="` + sizeOfImage + `" />
											<input type="radio" value="` + User.contentLanguage.current + `" autocomplete="off">
										</label>
										<div class="available-languages available-languages-content">
										`+ listContent + `
										</div>
									</div>
									<p class="service-type"></p>
									<div class="service-wrapper">
										<select class="service-select" name="service">
										</select>
									</div>
									<button>Submit</button>
							</form>
						</div>
					`;


		if (window.innerWidth < 1000) {
			menuListMobile.innerHTML += "<div" + language + "</div>";
			sidePanel.innerHTML = `<div class="qa-nav-sub-item language"><img src="` + filePath + User.interfaceLanguage.current.toLowerCase() + `.png" alt="` + User.interfaceLanguage.current.toLowerCase() + `" class="current-language" width="` + sizeOfImageMain + `" height="` + sizeOfImageMain + `" /></div>`;
		}

		else
			menuList.innerHTML += "<li" + ` class="qa-nav-sub-item language"><img src="` + filePath + User.interfaceLanguage.current.toLowerCase() + `.png" alt="` + User.interfaceLanguage.current.toLowerCase() + `" class="current-language"/>` + language + "</li>";

		inputsInterfaceLanguges = document.querySelectorAll(".available-languages-interface > label > input");
		inputsContentLanguges = document.querySelectorAll(".available-languages-content > label > input");
		inputsService = document.querySelectorAll(".service-wrapper > label > input");

		inputsInterfaceLanguges.forEach(function (elem) {
			elem.addEventListener("click", (e) => {
				User.interfaceLanguage.current = elem.value;
				const imageInterface = document.querySelector(".interface-wrapper-current");
				const mainImageLanguage = document.querySelector(".current-language");
				imageInterface.src = filePath + elem.value + ".png";
				mainImageLanguage.src = filePath + elem.value + ".png";
			});
		});

		inputsContentLanguges.forEach(function (elem) {
			elem.addEventListener("click", function () {
				User.contentLanguage.current = elem.value;
				const imageContent = document.querySelector(".content-wrapper-current");
				imageContent.src = filePath + elem.value + ".png";
			});
		});

		inputsService.forEach(function (elem) {
			elem.addEventListener("click", (e) => {
				User.service.current = elem.value;

			});
		});

		selectListService = document.querySelector(".service-select");
		User.service.available.map(option => {
				let optionTag = document.createElement("option");
				optionTag.text = option.name;
				optionTag.value = option.id;
				if (option.name == User.service.current.name)
					optionTag.setAttribute('selected', '');
				selectListService.appendChild(optionTag);
		});

		if (User.interfaceLanguage.current == "pol") {
			let languageLabel = document.querySelector(".language-label-interface");
			languageLabel.innerHTML = changeLanguage.POL[0];
			languageLabel = document.querySelector(".language-label-content");
			languageLabel.innerHTML = changeLanguage.POL[1];
			languageLabel = document.querySelector(".dropdown-content > form > button");
			languageLabel.innerHTML = changeLanguage.POL[2];
		}

		if (User.interfaceLanguage.current == "eng") {
			let languageLabel = document.querySelector(".language-label-interface");
			languageLabel.innerHTML = changeLanguage.ENG[0];
			languageLabel = document.querySelector(".language-label-content");
			languageLabel.innerHTML = changeLanguage.ENG[1];
			languageLabel = document.querySelector(".dropdown-content > form > button");
			languageLabel.innerHTML = changeLanguage.ENG[2];
		}

		let form = document.querySelector(".dropdown-content > form");
		form.action = User.endpointUrl;
	}

	const changeH1 = () => {
		let h1 = document.querySelector("h1"); 
		if (h1 !== null) {
			let tableh1 = h1.innerHTML.split(" ");
			let textH1 = "" + tableh1[0];
			let span = document.createElement("span"); 
			for(let i = 1; i < tableh1.length; i++){ 
				span.innerHTML += " " + tableh1[i];
			}
			h1.innerHTML = textH1;
			h1.appendChild(span);
		 }
	}

	listLangugeCreate();
	changeH1();

	let wrapperItems = document.querySelector(".qam-account-items-wrapper");
	wrapperItems.classList.add("qam-account-items-wrapper-underline");

	let userList = document.querySelector(".qa-nav-user-list");
	userList.classList.add("qa-nav-user-list-underline");

	let userLink = document.querySelector(".qa-nav-user-link");
	userLink.classList.add("qa-nav-user-link-underline");

	let mainLink= document.querySelectorAll(".qa-nav-main-link");
	mainLink.forEach( function (elem) {
		elem.classList.add("qa-nav-main-link-underline");
		}
	)

	let navMain= document.querySelector(".qa-nav-main");
	navMain.classList.add("qa-nav-main-list-underline"); 
 
	let logo= document.querySelector(".qa-logo-link");
	logo.textContent = "";

	let navMainMobile= document.querySelector(".qa-nav-sub");
	if(navMainMobile !== null){
		navMainMobile.classList.add("qa-nav-sub-mobile"); 
	}

	let mainLinkSelected= document.querySelector(".qa-nav-main-selected");
	if(mainLinkSelected != null){
		mainLinkSelected.classList.add("qa-nav-main-selected-underline"); 
	}
});
