<script>
	import { LinkHandler } from '$lib/utils/linkhandler.svelte';
	import {MetaTags} from 'svelte-meta-tags';
	import '../app.css';
	

	let { children } = $props();
</script>

<MetaTags
	title="Portfolio of Philipp Proff"
	titleTemplate=""
	description="This website is the contemporary representation of my works, thoughts and creativity."
	openGraph={{
		title: 'Portfolio of Philipp Proff',
		images: [
			{
				url: 'https://philippproff.eu/media/og-preview.webp',
				width: 1280,
				height: 720,
				alt: 'Portfolio header preview'
			}
		]
	}}
/>
<div
	class="grid grid-cols-12 grid-rows-[auto_1fr] gap-4 bg-background min-h-screen w-screen mt-8 md:p-0 px-4"
>
	<h3 class="small-container text-black uppercase">Intro</h3>
	<p class="big-container">
		Hi – my name is Philipp. I'm a designer and programmer. I have an M.A. in Design & Computation
		(TU Berlin and UdK Berlin) and a B.E. in Media Technologies (Media University Stuttgart). My
		practices and interests span across topics such as data interfaces, data visualizations,
		node-based interfaces, computational social science, human-computer interaction and the digital
		humanities. In my free time I enjoy playing table tennis, spikeball and reading books.
	</p>
	<div class="big-container flex gap-2 font-sans font-normal">
		<a
			href="https://vis.social/@proff"
			class="no-underline w-max border px-2 py-px hover:border-dotted transition"
			target="_blank"
			rel="noopener noreferrer"
		>
			<h3 class="flex gap-1 items-center">
				<img class="h-3" src={LinkHandler('/icons/link.svg')} alt="link icon" /> vis.social
			</h3>
		</a>
		<a
			href="https://github.com/elproffesore"
			class="no-underline w-max border px-2 py-px hover:border-dotted transition"
			target="_blank"
			rel="noopener noreferrer"
		>
			<h3 class="flex gap-1 items-center">
				<img class="h-3" src={LinkHandler('/icons/link.svg')} alt="link icon" />Github
			</h3>
		</a>
		<a
			href="mailto:philipp.proff@gmx.de"
			class="no-underline w-max border px-2 py-px hover:border-dotted transition"
			target="_blank"
			rel="noopener noreferrer"
		>
			<h3 class="flex gap-1 items-center">
				<img class="h-3" src={LinkHandler('/icons/link.svg')} alt="link icon" />E-Mail
			</h3>
		</a>
	</div>
	<h3 class="small-container text-black uppercase">Skills</h3>
	<p class="big-container font-sans font-normal mb-4 grid grid-cols-[75px_15px_auto] gap-2">
		<span><b>Frontend</b></span>
		<span>⭢</span>
		<span>JavaScript, HTML, CSS, Svelte, Vue</span>
		<span><b>Backend</b></span> <span>⭢</span>
		<span>NodeJS (Express,SvelteKit), Python (FastAPI)</span>
		<span><b>DataVis</b></span> <span>⭢</span> <span>JupyterNotebook, Observable, D3.js</span>
		<span><b>Tools</b></span> <span>⭢</span>
		<span>Figma, VSCode, Processing, Touchdesigner, Affinity Designer</span>
	</p>

	<hr class="col-span-12 md:col-start-3 md:col-span-8" />
	{@render children()}
</div>
